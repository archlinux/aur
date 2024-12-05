# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-openstep-plist-git
pkgver=0.4.0.r0.g61dc6ac
pkgrel=6
pkgdesc='OpenStep plist parser and writer written in Cython'
url='https://github.com/fonttools/openstep-plist'
license=('MIT')
arch=(any)
depends=(python)
checkdepends=(python-pytest)
makedepends=(
    python-{build,installer}
    python-setuptools-scm
    python-wheel
    cython
    git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "$pkgname"
    python -m build -wn
}

# check() {
#     cd "$pkgname"
#     local _pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
#     export PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_pyver"
#     python -m unittest discover
# }

package() {
    cd "$pkgname"
    python -m installer -d "$pkgdir" dist/*.whl
}
