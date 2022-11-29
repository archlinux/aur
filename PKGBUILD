# Maintainer: Patrick Armengol <patrickarmengol AT protonmail DOT com>

_name=xkcdrandom
pkgname=python-xkcdrandom
pkgver=0.0.2
pkgrel=1
pkgdesc="A random number generator made in accordance with https://xkcd.com/221/"
arch=('any')
url="https://github.com/patrickarmengol/xkcdrandom"
license=('MIT')
groups=()
depends=('python>=3.7')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
checkdepends=('python-pytest')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha256sums=('6b1b2bbbdfec9af893eb08ffbe39b7abb152de0be053982e7e215257134a978e')  # use updpkgsums to update

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH="$PWD/src" pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
