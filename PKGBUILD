# Maintainer: Julian Marcos <jmjl ~at~ iwnp ~dot~ org>
# Contributor: Andy Alt <andy400-dev at yahoo dot com>

pkgname=multimail
_altpkgname=MultiMail
pkgver=0.52
pkgrel=2
pkgdesc="offline mail packet reader that supports the Blue Wave, QWK, OMEN, SOUP and OPX formats"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'ppc64le')
url="http://wmcbrine.com/mmail/"
license=('GPL3')
depends=('ncurses')

source=("https://github.com/wmcbrine/MultiMail/archive/refs/tags/${pkgver}.tar.gz"
        "Makefile-DESTDIR.patch")
sha256sums=('3bfbf5d410dfff8bc33dfba98a7ba382d3168b8f0d79c2cbcbe6e53be9bba24c'
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
