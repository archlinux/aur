# Maintainer: Patrick Armengol <patrickarmengol AT protonmail DOT com>

_name=xkcdrandom
pkgname=python-xkcdrandom-git
pkgver=0.0.2.r0.gc038281
pkgrel=1
pkgdesc="A random number generator made in accordance with https://xkcd.com/221/"
arch=('any')
url="https://github.com/patrickarmengol/xkcdrandom"
license=('MIT')
groups=()
depends=('python>=3.7')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-wheel')
checkdepends=('python-pytest')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$_name::git+$url.git")
noextract=()
sha256sums=('SKIP')  # use updpkgsums to update

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name"
  PYTHONPATH="$PWD/src" pytest
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
