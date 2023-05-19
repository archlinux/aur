# Maintainer: AkechiShiro <akechishiro-aur at lahfa dot xyz>

_pyname=python-lzo
pkgname=python-${_pyname}-git
pkgver=v1.16
pkgrel=1
pkgdesc='Python bindings for the LZO data compression library'
arch=('any')
url="https://github.com/jd-boyd/$_pyname"
license=(GPL)
depends=(python)
conflicts=()
provides=(python-python-lzo)
makedepends=(git lzo python-pip python-build python-installer python-wheel python-setuptools)
checkdepends=()
source=("git+https://github.com/jd-boyd/$_pyname")
sha256sums=(SKIP)

# Tags are not up to date see issue : https://github.com/jd-boyd/python-lzo/issues/68
#pkgver() {
#  cd "$_pyname"
#  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

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
