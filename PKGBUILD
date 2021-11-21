# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Carlos Aznaràn <caznaranl@uni.pe>

pkgname=python2-py-cpuinfo
pkgver=8.0.0
pkgrel=1
arch=('any')
pkgdesc='Get CPU info with pure Python 2 & 3'
url='https://github.com/workhorsy/py-cpuinfo'
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/workhorsy/py-cpuinfo/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('a882516a062815782ebc2ad1edb8813ef566877444a6577d6a752b6e0bfce832010181ae20633d5338bdda3399c50fb670c650983b7ffa3064ff76c5cfb0f8d8')

prepare() {
  cp -a py-cpuinfo-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/py-cpuinfo-$pkgver
  python2 setup.py build
}

check() {
  cd "$srcdir"/py-cpuinfo-$pkgver
  python2 setup.py pytest
}

package_python2-py-cpuinfo() {
  cd py-cpuinfo-$pkgver
  python2 setup.py install --root "$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
