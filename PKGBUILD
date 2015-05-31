# Maintainer: Robert Knauer <robert@privatdemail.net>
# Contributor: philomath <philomath868 AT gmail DOT com>
# Contributor: Boohbah <boohbah at gmail.com>

pkgname=objconv
pkgver=2.38
pkgrel=1
pkgdesc='Object file converter and disassembler'
arch=('i686' 'x86_64')
url="http://www.agner.org/optimize/#objconv"
license=('GPL')
depends=('gcc-libs')
makedepends=('unzip')
source=(
  "${pkgname}-${pkgver}.zip"::"http://www.agner.org/optimize/${pkgname}.zip"
)
sha256sums=(
  '67b94b045a3ac642649debf07ea9ab22ef23efc6ed96ddfd16ac6d0651a150d0'
)

prepare() {
  cd "${srcdir}"
  unzip 'source.zip' -d 'source'
}

build() {
  cd "${srcdir}/source"
  g++ -o objconv -O2 *.cpp
}

package() {
  cd "${srcdir}"
  install -D -m755 "source/objconv" "${pkgdir}/usr/bin/objconv"
  install -D -m755 "objconv-instructions.pdf" "${pkgdir}/usr/share/doc/${pkgname}/manual.pdf"
}
