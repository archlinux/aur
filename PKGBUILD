# Maintainer: AkechiShiro <akechishiro-aur at lahfa dot xyz>

_pyname=lark
pkgname=python-${_pyname}-git
pkgver=1.1.5.r51.gccca874
pkgrel=1
pkgdesc='Parsing toolkit built with a focus on ergonomics, performance and modularity.'
arch=('any')
url="https://github.com/lark-parser/$_pyname"
license=(MIT)
depends=(python)
conflicts=()
provides=(python-lark)
makedepends=(git python-pip python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=("git+https://github.com/lark-parser/$_pyname")
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
