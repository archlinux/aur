# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pretend
pkgver=1.0.9
pkgrel=10
pkgdesc="A library for stubbing in Python 3.8"
arch=('any')
license=('BSD')
url="https://github.com/alex/pretend"
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alex/pretend/archive/v$pkgver.tar.gz")
sha512sums=('976e3272557aecfb11e4147a868ea96e23546e277d57d726f41b945103bef3451039716e6bbc5082d691fa1fd331c06b3d0f8b254deb0510948153571326eaf0')

build() {
  cd "$srcdir"/pretend-$pkgver
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/pretend-$pkgver
  python3.8 setup.py pytest
}

package() {
  cd pretend-$pkgver
  python3.8 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
}
