# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: neodarz <neodarz@neodarz.net>

_binname="tiv"
pkgname="terminalimageviewer"
pkgver=1.2.1
pkgrel=2
pkgdesc="Display images in a (modern) terminal using RGB ANSI codes and unicode graphic blocks"
arch=('x86_64')
url="https://github.com/stefanhaustein/TerminalImageViewer"
license=('Apache-2.0' 'GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'imagemagick')
provides=("${_binname}")
conflicts=("${_binname}")
_pkgsrc="TerminalImageViewer-${pkgver}"
source=("${_pkgsrc}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('08d0c30e3ffa47b69d1bce07bea56f04b7deb4a8a79307ce435a4f0852fbcd5f')

build() {
  cd "${srcdir}/${_pkgsrc}/src"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "src"
  make install DESTDIR="${pkgdir}" prefix='/usr'
}
