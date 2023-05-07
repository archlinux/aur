# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aeppl
_name=${pkgname#python-}
pkgver=0.1.4
pkgrel=1
pkgdesc="Tools for an Aesara-based PPL"
arch=(any)
url="https://github.com/aesara-devs/aeppl"
license=(MIT)

makedepends=(python-setuptools)
depends=(
  python-numpy
  python-aesara
  python-typing_extensions
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eb5dad5774a666fcf77db840e7ae3ff910bcfd77116b05be86794981b9ba5637')

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
