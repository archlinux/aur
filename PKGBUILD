# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=cadet-gtk-git
pkgver=0.5.0.r40.g46b0961
pkgrel=1
pkgdesc="A GTK based GUI for the CADET subsystem of GNUnet."
url="https://gitlab.com/TheJackiMonster/cadet-gtk"
license=('GPL3')
arch=( 'any' )
depends=('gtk3' 'libhandy' 'gnunet' 'jansson' 'libnotify')
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
	
	install -Dm644 "resources/icon/full_color_32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/cadet-gtk.png"
	install -Dm644 "resources/icon/full_color_64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/cadet-gtk.png"
	install -Dm644 "resources/icon/full_color_128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/cadet-gtk.png"
	install -Dm644 "resources/icon/full_color_256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/cadet-gtk.png"
	install -Dm644 "resources/icon/full_color_512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/cadet-gtk.png"
	
	install -Dm644 "cadet-gtk.desktop" "$pkgdir/usr/share/applications/cadet-gtk.desktop"
}

