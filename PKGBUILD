# Maintainer: Benjamin Hodgetts <ben@xnode.org>

pkgname=1oom-git
pkgver=r314.699af7e
pkgrel=1
pkgdesc="1oom is a Master of Orion (1993) game engine recreation."
arch=(x86_64)
url=https://gitlab.com/KilgoreTroutMaskReplicant/1oom
license=('GPL2')
depends=(sdl2 libsamplerate)
makedepends=(git)
provides=(1oom)
conflicts=(1oom)
source=('git+https://gitlab.com/KilgoreTroutMaskReplicant/1oom.git')
md5sums=('SKIP')

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
