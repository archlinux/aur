# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=cadet-gtk-git
pkgver=0.1.3.r0.gdbf01c8
pkgrel=1
pkgdesc="A GTK based GUI for the CADET subsystem of GNUnet."
url="https://gitlab.com/TheJackiMonster/cadet-gtk"
license=('GPL3')
arch=( 'i686' 'x86_64' 'aarch64' 'armv6h' 'armv7h' 'arm' )
depends=('gtk3' 'libhandy' 'gnunet')
makedepends=(git cmake make)
provides=(cadet-gtk)
conflicts=(cadet-gtk)
source=("git+https://gitlab.com/TheJackiMonster/cadet-gtk.git")
md5sums=('SKIP')

pkgver() {
    cd cadet-gtk
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/cadet-gtk"
	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/cadet-gtk"
	make install DESTDIR="$pkgdir"
}

