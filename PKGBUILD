# Maintainer: AkechiShiro <akechishiro-aur at lahfa dot xyz>

_pyname=dissect.cstruct
pkgname=python-${_pyname}-git
pkgver=3.6.r2.gfeb6476
pkgrel=1
pkgdesc='A Dissect module implementing a parser for C-like structures.'
arch=('any')
url="https://github.com/fox-it/$_pyname"
license=(Apache)
depends=(python)
conflicts=()
provides=(python-dissect.cstruct)
makedepends=(git lzo python-pip python-build python-installer python-wheel python-setuptools python-setuptools-scm)
checkdepends=(python-pytest)
source=("git+https://github.com/fox-it/$_pyname")
sha256sums=(SKIP)

pkgver() {
  cd "$_pyname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "${srcdir}/${_pyname}" clean -dfx
}

build() {
    cd "$_pyname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pyname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
    cd "$srcdir/$_pyname"

    pytest
}

