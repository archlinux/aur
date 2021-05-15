# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Benjamin Hodgetts <ben@xnode.org>

pkgname=1oom-git
pkgver=r777.912dce1
pkgrel=2
pkgdesc="1oom is a Master of Orion (1993) game engine recreation."
arch=(x86_64)
url=https://gitlab.com/Tapani_/1oom
license=('GPL2')
depends=('libsamplerate' 'sdl2_mixer')
makedepends=('git')
provides=('1oom')
conflicts=('1oom')
source=('git+https://gitlab.com/Tapani_/1oom.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/1oom"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd 1oom
    autoreconf -fi
    ./configure --prefix=/usr --disable-hwsdl1
    make
}

package() {
    cd 1oom
    make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
