pkgname=clash-nyanpasu-bin
_pkgname=clash-nyanpasu
_upstream_tag=v2.0.0-beta.2
_source_url=https://github.com/libnyanpasu/clash-nyanpasu/releases/download/v2.0.0-beta.2/Clash.Nyanpasu_2.0.0-beta.2_amd64.deb
pkgver=2.0.0beta.2
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
sha256sums=('9acd66bcc6634ef50b5c8ca06bf455373e65db845355cb325357ebad13c08598')

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
