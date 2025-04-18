pkgname=pe-bear-bin
pkgver=0.7.0.4
_qtver=6.4.2
pkgrel=1
pkgdesc="Freeware reversing tool for PE files"
install=pe-bear-bin.install
url="https://hshrzd.wordpress.com/pe-bear/"
arch=('x86_64')
license=('custom')
depends=('qt6-base')
conflicts=('pe-bear' 'pe-bear-git')
source=("https://github.com/hasherezade/pe-bear/releases/download/v${pkgver}/PE-bear_${pkgver}_qt${_qtver}_x64_linux.tar.xz")
sha256sums=('98605f4b570773172445433b038d1bbc143658f2aa0e80ba9b7b82d3a6bef188')

package() {
  cd "PE-bear_${pkgver}_qt${_qtver}_x64_linux" || return

  # Install binary
  install -Dm755 "bin/PE-bear" "${pkgdir}/usr/bin/PE-bear"

  # Install shared files
  cp -r "share/" "${pkgdir}/usr/share/" || return

  # Install license and signature files
  install -Dm644 "SIG.txt" "${pkgdir}/usr/share/pe-bear/SIG.txt"
  install -Dm644 "capstone_LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/capstone_LICENSE.TXT"
}
