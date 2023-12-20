# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pyclipper-git
pkgver=1.3.0.post5.r3.g410553d
pkgrel=1
pkgdesc='Cython wrapper for the C++ translation of the Angus Johnsons Clipper library'
url='https://github.com/fonttools/pyclipper'
license=('MIT')
arch=(any)
depends=(python)
makedepends=(cython
             python-{build,installer,wheel,pip}
             python-setuptools-scm
             git)
checkdepends=(python-pytest)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "$pkgname"
    python setup.py build_ext --inplace
    python setup.py build
}

check() {
    cd "$pkgname"
    python setup.py test
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

