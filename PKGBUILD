# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-dtw-python-git
pkgver=1.1.10.r231
pkgrel=2
pkgdesc="Python port of R's Comprehensive Dynamic Time Warp algorithm package"
arch=('any')
url='https://github.com/DynamicTimeWarping/dtw-python'
license=('GPL3')
depends=('python>=3.6' 'python-numpy' 'python-scipy' 'cython')
makedepends=('git' 'python-setuptools')
provides=('python-dtw-python')
conflicts=("python-dtw-python")
source=(
    "${pkgname}::git+${url}")
md5sums=(
    'SKIP')


pkgver() {
    cd "${pkgname}"
    printf "%s.r%s" "$(python setup.py --version)" "$(git rev-list --count HEAD)"
}


build() {
    cd "${pkgname}"
    python setup.py build
}


package() {
    cd "${pkgname}"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

