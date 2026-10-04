pkgname=clash-nyanpasu-bin
_pkgname=clash-nyanpasu
_upstream_tag=v2.0.0-beta.1
_source_url=https://github.com/libnyanpasu/clash-nyanpasu/releases/download/v2.0.0-beta.1/Clash.Nyanpasu_2.0.0-beta.1_amd64.deb
pkgver=2.0.0beta.1
pkgrel=1
pkgdesc="A Clash GUI based on tauri. Clash Nyanpasu! (∠・ω< )⌒☆​"
arch=('x86_64')
url="https://github.com/LibNyanpasu/clash-nyanpasu"
license=('GPL3')
options=('!strip' '!debug')
depends=(webkit2gtk-4.1 gtk3 libayatana-appindicator mihomo)
makedepends=('libarchive')
conflicts=('clash-nyanpasu-git' 'clash-nyanpasu-appimage' 'clash-nyanpasu')
provides=('clash-nyanpasu')
optdepends=('clash-rs: custom protocol network proxy, coding with rust')
source=("${_pkgname}-${pkgver}-${CARCH}.deb::${_source_url}")
sha256sums=('4b731a1f47983a6cef330b093a8dc3c6bb3675ede7d5f37893797c63617ec4e3')

package() {
  local -a data_archives=("${srcdir}"/data.tar.*)
  if (( ${#data_archives[@]} != 1 )) || [[ ! -f ${data_archives[0]} ]]; then
    printf '%s\n' 'Expected exactly one Debian data archive' >&2
    return 1
  fi
  bsdtar -xf "${data_archives[0]}" -C "${pkgdir}"
  rm -f "${pkgdir}"/usr/bin/{clash,mihomo,clash-rs,mihomo-alpha,clash-rs-alpha,meow}
  # thanks https://aur.archlinux.org/clash-meta-is-mihomo.git
}
