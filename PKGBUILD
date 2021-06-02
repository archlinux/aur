# Maintainer: MatMoul <matmoul@gmail.com>

pkgname=alpm_octopi_utils-dev
pkgver=1.0.2
_pkgrealbase=alpm_octopi_utils
_commit=2bb9349507f8155155c9b5f12b1f30e60e157d30
pkgrel=3
pkgdesc="Alpm utils for Octopi"
url="https://tintaescura.com/projects/octopi/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('pacman-contrib')
makedepends=('vala')
source=("pacman6.patch"
        "https://github.com/aarnt/${_pkgrealbase}/archive/${_commit}.tar.gz")
sha256sums=('0e47e06688c075b62443d8af99d8d65e70e2f231f137c386465a1bf3f27487a3'
            'SKIP')

prepare() {
    cd "${_pkgrealbase}-${_commit}"
    echo "Patching pacman 6"
    patch --forward --strip=1 --input="${srcdir}/pacman6.patch"
}

build() {
    cd "${_pkgrealbase}-${_commit}"
    make
}

package() {
    cd "${_pkgrealbase}-${_commit}"
    install -D -m755 src/libalpm_octopi_utils.so "$pkgdir"/usr/lib/libalpm_octopi_utils.so
    install -D -m644 src/libalpm_octopi_utils.pc "$pkgdir"/usr/lib/pkgconfig/libalpm_octopi_utils.pc
    install -D -m644 src/alpm_octopi_utils.h "$pkgdir"/usr/include/alpm_octopi_utils.h
}
 
