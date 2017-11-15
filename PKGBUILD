# Maintainer: Nahuel Morata <nahuelmorata@gmail.com>
# Contributor: Brice Waegeneire <bricewge at gmail dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Carl George < arch at cgtx dot us >

pkgbase=python-click-6.7
pkgname=("python-click-6.7" "python2-click-6.7")
_realname=click
pkgver=6.7
pkgrel=2
pkgdesc="A simple wrapper around optparse for powerful command line utilities"
arch=("any")
url="http://click.pocoo.org/"
license=("BSD")
source=("https://github.com/pallets/$_realname/archive/$pkgver.tar.gz")
sha256sums=('40b20383dcbfbe73ab0917374f3dbe866fcf0d88c2a348618bf4419ea136f0dd')

prepare() {
    tar xf "$pkgver.tar.gz"
    cp -R "$_realname-$pkgver" "$_realname-$pkgver-python2"
    mv "$_realname-$pkgver" "$_realname-$pkgver-python3"
}

build() {
  cd "${srcdir}/${_realname}-${pkgver}-python3"
  python setup.py build

  cd "${srcdir}/${_realname}-${pkgver}-python2"
  python2 setup.py build
}

package_python-click-6.7() {
  depends=("python")
  makedepends=("python-setuptools")
  provides=("python-click")
  conflicts=("python-click")
  cd "${srcdir}/${_realname}-${pkgver}-python3"
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-click-6.7() {
  depends=("python2")
  makedepends=("python2-setuptools")
  provides=("python2-click")
  conflicts=("python2-click")
  cd "${srcdir}/${_realname}-${pkgver}-python2"
  python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
