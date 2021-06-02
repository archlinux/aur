# Maintainer: MatMoul <matmoul@gmail.com>

pkgname=alpm_octopi_utils-dev
pkgver=1.0.2
_pkgrealbase=alpm_octopi_utils
_commit=2bb9349507f8155155c9b5f12b1f30e60e157d30
pkgrel=4
pkgdesc="Alpm utils for Octopi"
url="https://tintaescura.com/projects/octopi/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('pacman-contrib')
makedepends=('vala')
source=("0001-Added-pacman-6.0-support.patch"
        "0002-Fix-missing-out-statement-s.patch"
        "https://github.com/aarnt/${_pkgrealbase}/archive/${_commit}.tar.gz")
sha256sums=('edd4bdc1972fd6dbefae6539a18b938b483a43347500ffb9f7e2830530994e90'
            '23d5bcf70e3c200c041041487e50c3c404428b6a11ab1d3d434cf04f2efe3939'
            'SKIP')

prepare() {
    cd "${_pkgrealbase}-${_commit}"
    echo "Patching pacman 6"
    patch --forward --strip=1 --input="${srcdir}/0001-Added-pacman-6.0-support.patch"
    patch --forward --strip=1 --input="${srcdir}/0002-Fix-missing-out-statement-s.patch"
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
 
