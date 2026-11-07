# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=switchworks-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Control plane for coding agents across your machines (swk, tray icon, systemd units) (Pre-compiled Binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/jm2/switchworks"
license=('GPL-3.0-or-later' 'OFL-1.1')
depends=('hicolor-icon-theme')
optdepends=('gnome-shell-extension-appindicator: tray icon on GNOME')
provides=("switchworks=${pkgver}")
conflicts=('switchworks')
# The release binaries are static and already stripped: nothing to strip and
# no debug info to split out.
options=('!strip' '!debug')
# Repackaged from the release's .deb files; the sums match the release's
# SHA256SUMS.txt and GitHub's published asset digests.
source_x86_64=("switchworks-${pkgver}-amd64.deb::${url}/releases/download/v${pkgver}/switchworks-amd64.deb")
source_aarch64=("switchworks-${pkgver}-arm64.deb::${url}/releases/download/v${pkgver}/switchworks-arm64.deb")
sha256sums_x86_64=('e7165a9173751d943db5d3fb0a15e22ad3b122f50152b952fb35a29ee9d46cfa')
sha256sums_aarch64=('562106a4f8788724b6896caf4d80942df0aa39b32591283634c268095d4e0c40')

package() {
  bsdtar -xf data.tar.* -C "${pkgdir}"
  # Arch keeps license texts under /usr/share/licenses; drop Debian-only files.
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}"/usr/share/doc/switchworks/OFL-*.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
  rm -rf "${pkgdir}/usr/share/lintian" \
    "${pkgdir}/usr/share/doc/switchworks/changelog.gz" \
    "${pkgdir}/usr/share/doc/switchworks/copyright"
}
