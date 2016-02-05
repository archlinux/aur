# Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgname=("python-keras-doc")
_pkgname="keras"
pkgver="0.3.0"
pkgrel="1"
pkgdesc="Documentation and examples for python-keras"
arch=('i686' 'x86_64')
url="https://github.com/fchollet/keras"
license=('MIT')
makedepends=('mkdocs')
source=("${_pkgname}.tar.gz::https://github.com/fchollet/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('35a57b3e782e954c8166c8e30704d540862c4bde2c1486b5616b5215dd82bd7b')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}/docs"
  mkdocs build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  mkdir -p $pkgdir/usr/share/doc/python-keras/html
  mkdir -p $pkgdir/usr/share/doc/python-keras/examples
  cp -rf examples/* "$pkgdir/usr/share/doc/python-keras/examples/"
  cp -rf docs/site/* "$pkgdir/usr/share/doc/python-keras/html/"
  find $pkgdir/usr/share/doc/python-keras/ -type f -exec chmod 0644 {} \;
  find $pkgdir/usr/share/doc/python-keras/ -type d -exec chmod 0755 {} \;
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
