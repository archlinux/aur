# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
_pkgname=mlpolygen
pkgname=$_pkgname-git
pkgver=r14.1948ebd
pkgrel=1
pkgdesc="a maximal-length polynomial generator for linear feedback shift registers"
arch=(any)
url="https://github.com/hayguen/mlpolygen"
license=('GPL3')
depends=(gmp)
makedepends=(git cmake)
optdepends=()
source=("git+https://github.com/hayguen/mlpolygen.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule init
    git submodule update
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake -B build \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    cd "${srcdir}/${_pkgname}"
    DESTDIR="$pkgdir" cmake --install build
}
