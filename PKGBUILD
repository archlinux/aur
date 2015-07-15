# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=spop-git
_pkgname=spop
pkgver=327.3890ab3
pkgrel=1
pkgdesc="A Spotify client running as a daemon, similar to mpd."
arch=('i686' 'x86_64')
url='https://github.com/Schnouki/spop'
license=('GPL')
depends=('libspotify')
makedepends=('git' 'cmake')
source=('git+https://github.com/Schnouki/spop.git')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cp -a ${_pkgname} ${_pkgname}-build
    cd ${_pkgname}-build
    cmake -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr .
    make
}

package() {
    cd ${srcdir}/${_pkgname}-build
    make DEST="${pkgdir}" install
    install -D -m 644 ${srcdir}/${_pkgname-build}/spopd.conf.sample ${pkgdir}/usr/share/doc/spop/spopd.conf.sample
}

md5sums=('SKIP')
