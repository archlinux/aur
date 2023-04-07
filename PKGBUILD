# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-railroad
pkgver=0.5.0
pkgrel=2
pkgdesc="A functional library for data processing"
url="https://github.com/s-m-i-t-a/railroad"
license=('MIT')
arch=('any')
depends=('python-boltons' 'python-six' 'python-toolz')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-mock')
source=("https://github.com/s-m-i-t-a/railroad/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0f180dd9d80b80aa36d65a52336ea9851b5ea178c28449a546b84b86a9d721add2b8a201367f0f32be9f6ba0ca3ee24bdf0e509a5a8ec1a3d7bb918f48c52e6c')

prepare() {
  cd railroad-$pkgver
  # Not needed for Python 3
  sed -i '/funcsigs/d' setup.py
}

build() {
  cd railroad-$pkgver
  python setup.py build
}

check() {
  cd railroad-$pkgver
  pytest
}

package() {
  cd railroad-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
