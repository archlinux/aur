# Maintainer: DrZingo <markus at borgelin dot org>

_pkgname=abc80sim
pkgname=abc80sim-git
pkgver=r537.1a092cf
pkgrel=1
pkgdesc="An SDL based emulator of a Luxor ABC80"
url="https://git.zytor.com/abc80/abc80sim.git"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('sdl' 'libpng')
makedepends=('git')
source=('git+https://git.zytor.com/abc80/abc80sim.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${srcdir}/${_pkgname}
    git checkout main
}

build() {
    cd ${srcdir}/${_pkgname}
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd ${srcdir}/${_pkgname}

    install -D abc80 $pkgdir/usr/bin/abc80
    install -Dm644 abc80.man $pkgdir/usr/share/man/man1/abc80.1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
    #make DESTDIR=${pkgdir} install
}

# vim:set ts=4 sw=4 et:
