# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=python2-py-cpuinfo
pkgver=7.0.0
pkgrel=3
arch=('any')
pkgdesc='Get CPU info with pure Python 2 & 3'
url='https://github.com/workhorsy/py-cpuinfo'
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/workhorsy/py-cpuinfo/archive/v$pkgver.tar.gz")
sha512sums=('7046ee705d05c8b577db554b4bc82cc5a588f7263ce36194792eeaeba56a3466180d88187aad74792759f02ebcd32497e38354b3274f5453c1076ae23f9bedd0')

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
