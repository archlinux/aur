# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=cadet-gtk-git
pkgver=0.3.0.r3.gac61777
pkgrel=1
pkgdesc="A GTK based GUI for the CADET subsystem of GNUnet."
url="https://gitlab.com/TheJackiMonster/cadet-gtk"
license=('GPL3')
arch=( 'any' )
depends=('gtk3' 'libhandy' 'gnunet' 'jansson')
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

