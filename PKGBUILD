# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aeppl
_name=${pkgname#python-}
pkgver=0.1.2
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
sha256sums=('ec2a77a7cedaa586393f6f79dbcfa352f30c394fb9040f9c1adac13828527e06')

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
