# Maintainer: Trougnouf (Benoit Brummer) <trougnouf@gmail.com>

_name=pyephem
pkgname=("python-${_name}-git")
pkgver=4.2.1.r2.g114dbd0
pkgrel=1
pkgdesc="Ephem python package for performing high-precision astronomy computations"
arch=('i686' 'x86_64')
url="https://rhodesmill.org/pyephem/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'git' 'python-docutils' 'python-sphinx')
provides=("python-${_name}")
conflicts=("python-${_name}")
source=("git+https://github.com/brandon-rhodes/${_name}.git")
md5sums=('SKIP')


pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_name}"
  python -m pip wheel --no-build-isolation --no-deps -w dist .
}

package() {
  cd "${_name}"
  PYTHONOPTIMIZE=1 python -m pip install --no-build-isolation --no-deps --root="$pkgdir" --prefix=/usr dist/*.whl
}

