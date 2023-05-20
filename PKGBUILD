# Maintainer: AkechiShiro <akechishiro-aur at lahfa dot xyz>

_pyname=python-magic
pkgname=python-${_pyname}-git
pkgver=0.4.27.r15.g3ab9608
pkgrel=1
pkgdesc='A python wrapper for libmagic'
arch=('any')
url="https://github.com/ahupp/$_pyname"
license=(GPL)
depends=(python)
conflicts=()
provides=(python-python-magic)
makedepends=(git python-pip python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=("git+https://github.com/ahupp/$_pyname")
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
    python setup.py build
}

package() {
    cd "$_pyname"
    python setup.py install --root="$pkgdir" --optimize=1
}

check() {
    cd "$srcdir/$_pyname"
    export LC_ALL=en_US.UTF-8
    pytest
}
