# Maintainer: Felix Wiegand <koffeinflummi@gmail.com>

_pkgname="armake"
pkgname="${_pkgname}-git"
pkgver=0.6.3.r0.g94895d4
pkgrel=1
pkgdesc="An open-source implementation of the Arma modding tools."
arch=('i686' 'x86_64')
url="https://github.com/KoffeinFlummi/armake"
license=('GPL2')
depends=('openssl')
optdepends=()
makedepends=('bison' 'flex')
conflicts=('armake')
source=("git+https://github.com/KoffeinFlummi/armake.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | tail -c +2 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    make DESTDIR="${pkgdir}" install
}
