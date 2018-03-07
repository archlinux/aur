# Maintainer: Oliver Papst <opapst at ikp dot tu-darmstadt dot de>
pkgname=libmfile-git
_pkgname=libmfile
pkgver=r57.a18a066
pkgrel=2
pkgdesc="Library for compressed storage of spectroscopy data in nuclear physics"
arch=('i686' 'x86_64')
url="https://gitlab.ikp.uni-koeln.de/jmayer/libmfile"
license=('BSD')
conflicts=('libmfile')
provides=('libmfile')
depends=('glibc')
makedepends=('git'
             'cmake')
options=(!emptydirs)
source=('git+https://gitlab.ikp.uni-koeln.de/jmayer/libmfile.git#branch=anniversary')
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr . || return 1
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR=${pkgdir} install
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 0644 license.md "${pkgdir}/usr/share/licenses/${pkgname}/"
}
