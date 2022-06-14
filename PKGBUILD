# Maintainer: Frederic Bezies < fredbezies at gmail dot com>
# Based on old quakespasm-svn PKGBUILD 
# which was last maintained by Mark Vainomaa <mikroskeem round around a mikroskeem dot eu>

pkgname=quakespasm-git
_pkgname=quakespasm
pkgver=0.94.5.r0.gc00aa57
pkgrel=1
pkgdesc="A modern Quake 1 engine. Forked from Fitzquake and improved in many ways such as Vorbis/MP3 support for music. - Development version"
arch=('i686' 'x86_64')
url="http://quakespasm.sourceforge.net"
license=('GPL2')
depends=('libvorbis' 'libmad' 'sdl2')
makedepends=('subversion')
conflicts=('quakespasm')
provides=('quakespasm')
install=${pkgname}.install
source=('git+https://git.code.sf.net/p/quakespasm/quakespasm')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^quakespasm-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}/Quake/"
    msg "Starting make..."
    make DO_USERDIRS=1 USE_SDL2=1
}

package() {
    cd "${srcdir}/${_pkgname}/Quake/"
    install -D -m 755 quakespasm "${pkgdir}/usr/bin/${pkgname}"
}

