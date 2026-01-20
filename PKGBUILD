# Maintainer: ThatOneCalculator <kainoa@t1c.dev>

_pkgname="python-libbbf"
pkgname="$_pkgname"
pkgver=0.3.0
pkgrel=1
pkgdesc="Bound Book Format (BBF) Tools & Python Bindings"
url="https://github.com/ef1500/libbbf-python"
license=('MIT')
arch=('any')
depends=(
  xxhash
  python
)
makedepends=(
  gcc
  pybind11
  python-setuptools
  python-wheel
)
provides=("$_pkgname=$pkgver")
conflicts=(
    # "$_pkgname"
    "$_pkgname-bin"
    "$_pkgname-git"
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('06f01a2c190ff836597036a3ec3758069d63ee679d59592dc4d1c63decd377e7')

prepare() {
  cd "$srcdir/libbbf-python-$pkgver"
  sed -i 's/\(setuptools\|pybind11\)==/\1>=/g' pyproject.toml
}

build() {
  cd "$srcdir/libbbf-python-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/libbbf-python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
