# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-railroad
pkgver=0.5.0
pkgrel=3
pkgdesc="A functional library for data processing"
url="https://github.com/s-m-i-t-a/railroad"
license=('MIT')
arch=('any')
depends=('python-boltons' 'python-six' 'python-toolz')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/s-m-i-t-a/railroad/archive/$pkgver/$pkgname-$pkgver.tar.gz" "use-unittest-mock.patch")
sha512sums=('0f180dd9d80b80aa36d65a52336ea9851b5ea178c28449a546b84b86a9d721add2b8a201367f0f32be9f6ba0ca3ee24bdf0e509a5a8ec1a3d7bb918f48c52e6c'
            'e80eac9386c4b9c453091be071ee81d76824105c520a1d9f6af26260e22c5f695f705b3b716494e146b568bb63bad8744aeb5f68ccf03d7e01d280051a91c368')

prepare() {
  cd railroad-$pkgver
  # Not needed for Python 3
  sed -i '/funcsigs/d' setup.py

  patch -Np1 -i ${srcdir}/use-unittest-mock.patch
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
