# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aeppl
_name=${pkgname#python-}
pkgver=0.1.3
pkgrel=1
pkgdesc="Tools for an Aesara-based PPL"
arch=(any)
url="https://github.com/aesara-devs/aeppl"
license=(MIT)

makedepends=(python-setuptools)
depends=(
  python-numpy
  python-scipy
  python-aesara
  python-typing_extensions
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('326c38c29ef2b08deace532b5b5717b6403d0bacbe5a30ab55149ec6396a9c38')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python setup.py build
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
