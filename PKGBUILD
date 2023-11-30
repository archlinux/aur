# shellcheck disable=SC2034,2154,2148
# Maintainer: amo <https://aur.archlinux.org/account/amo>

_name=drf-writable-nested
pkgname=python-drf-writable-nested
pkgver=0.7.0
pkgrel=1
pkgdesc="Writable nested model serializer for Django REST Framework"
arch=('any')
url="https://github.com/beda-software/drf-writable-nested"
license=('LGPL-3')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/beda-software/drf-writable-nested/archive/v$pkgver.tar.gz")
sha256sums=('3a3f3985c97ee9288e691a290fc991a5811af5e03511660f084065e06c7de0fe')

build() {
  cd "$_name-$pkgver" || exit
  python setup.py build
}

package() {
  cd "$_name-$pkgver" || exit

  export PYTHONHASHSEED=0
  python setup.py install --skip-build \
      --optimize=1 \
      --prefix=/usr \
      --skip-build \
      --root="$pkgdir"

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
