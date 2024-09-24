pkgname=pe-bear-bin
pkgver=0.7.0
_qtver=6.2
pkgrel=1
pkgdesc="Freeware reversing tool for PE files"
install=pe-bear-bin.install
url="https://hshrzd.wordpress.com/pe-bear/"
arch=('x86_64')
license=('custom')
depends=('qt6-base')
conflicts=('pe-bear' 'pe-bear-git')
source=("https://github.com/hasherezade/pe-bear/releases/download/v${pkgver}/PE-bear_${pkgver}_qt${_qtver}_x64_linux.tar.xz")
sha256sums=('219b059074aa8697740e799d4ad19a2ae43edd912c3a0e239ff291ca18e4d652')

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
