# Maintainer: Andy Alt <andy400-dev at yahoo dot com>

pkgname=multimail
_altpkgname=mmail
pkgver=0.52
pkgrel=1
pkgdesc="offline mail packet reader that supports the Blue Wave, QWK, OMEN, SOUP and OPX formats"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'ppc64le')
url="http://wmcbrine.com/mmail/"
license=('GPL3')
depends=('ncurses')

source=("http://wmcbrine.com/mmail/bin/${_altpkgname}-${pkgver}.tar.gz"
        "Makefile-DESTDIR.patch")
sha256sums=('f5567236142833d8eb6d0e76d982c7e9bdf10885bb4f7564b40c01344a9ad47d'
            'fe457d7095e5ac1419b425d8aa543abf3a00b3ff2ddf59714d3d0c9902bb6ff8')

build() {
    #cd "${srcdir}/${pkgname}-${pkgver}"
    #./configure --prefix=/usr
    cd "${srcdir}/${_altpkgname}-${pkgver}"
    cp ../../Makefile-DESTDIR.patch ./
    patch Makefile Makefile-DESTDIR.patch
}

package() {
    cd "${srcdir}/${_altpkgname}-${pkgver}"
    make
    make DESTDIR="${pkgdir}"/usr install
}
