# Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgname=("python-keras-doc")
_pkgname="keras"
pkgver="1.0.7"
pkgrel="1"
pkgdesc="Documentation and examples for python-keras"
arch=('any')
url="https://github.com/fchollet/keras"
license=('MIT')
makedepends=('mkdocs')
source=("${_pkgname}-${pkgver}::https://github.com/fchollet/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b94158c9dd09d3af79acf0ea06ed0084d4645b0ea1b62168f10929260731b14e')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}/docs"
  python autogen.py
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
