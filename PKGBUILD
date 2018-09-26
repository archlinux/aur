# Maintainer: Nahuel Morata <nahuelmorata@gmail.com>
# Contributor: Gonçalo Camelo Neves Pereira <goncalo_pereira@outlook.pt>
# Contributor: Brice Waegeneire <bricewge at gmail dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Carl George < arch at cgtx dot us >

pkgbase=python-click-5.1
pkgname=("python-click-5.1" "python2-click-5.1")
_realname=click
pkgver=5.1
pkgrel=3
pkgdesc="A simple wrapper around optparse for powerful command line utilities"
arch=("any")
url="http://click.pocoo.org/"
license=("BSD")
depends=("python-setuptools")
source=("https://github.com/pallets/$_realname/archive/$pkgver.tar.gz")
sha256sums=('56d0ce25248d001b3767fa9c3b357384d484b34bcbde46c69b79cef1f25d5f06')

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

package_python-click-5.1() {
  depends=("python-setuptools")
  provides=("python-click")
  conflicts=("python-click")
  cd "${srcdir}/${_realname}-${pkgver}-python3"
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-click-5.1() {
  depends=("python2-setuptools")
  provides=("python2-click")
  conflicts=("python2-click")
  cd "${srcdir}/${_realname}-${pkgver}-python2"
  python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
