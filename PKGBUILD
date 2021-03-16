# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-libthumbor
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=1
pkgdesc="Python's extensions to thumbor"
arch=(any)
url="https://github.com/thumbor/libthumbor"
license=('MIT')
depends=(python)
makedepends=(python-setuptools python-dephell)
source=("https://github.com/thumbor/libthumbor/archive/$pkgver.tar.gz")
b2sums=('79bf3f48db8eef6f2eb19aae1b66484651b4a15a68bfd8ae310653a256f5a4e16009fcaa87d1ab98178f5cdeeaa1d16b5f04107b369481942d4411be589b1ce7')

prepare() {
  cd "$_name-$pkgver"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
