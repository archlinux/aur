# Maintainer: Simon Schubert <2-aur@0x2c.org>
pkgname=sparse-fio-git
pkgver=r34.7710f44
pkgrel=1
pkgdesc="Tool to work with sparse files like hard disk images"
arch=('i686' 'x86_64')
url="https://github.com/anyc/sparse-fio"
license=('GPL')
depends=("util-linux-libs")
makedepends=('git')
source=(${pkgname}::"git+https://github.com/anyc/sparse-fio.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    make BUILD_SINGLE_EXECUTABLE=0
}

check() {
    cd "${srcdir}/${pkgname}"
    LD_LIBRARY_PATH=. ./tests.sh
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" install
}
