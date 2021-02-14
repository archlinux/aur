# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=cadet-gtk-git
pkgver=0.6.1
pkgrel=1
pkgdesc="A GTK based GUI for the CADET subsystem of GNUnet."
url="https://gitlab.com/gnunet-messenger/cadet-gtk"
license=('GPL3')
arch=( 'any' )
depends=('gtk3' 'libhandy' 'gnunet' 'jansson' 'libnotify')
makedepends=(git gcc pkgconf bash)
provides=(cadet-gtk)
conflicts=(cadet-gtk)
source=("git+https://gitlab.com/gnunet-messenger/cadet-gtk.git")
md5sums=('SKIP')

pkgver() {
    cd cadet-gtk
    git tag | sort -r | head -1 | cut -c2-
}

build() {
	cd "${srcdir}/cadet-gtk"
	sh build.sh "release"
}

package() {
	cd "${srcdir}/cadet-gtk"
	install -Dm755 "cadet-gtk" "$pkgdir/usr/bin/cadet-gtk"
	
	install -Dm644 "resources/icon/full_color_32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/cadet-gtk.png"
	install -Dm644 "resources/icon/full_color_64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/cadet-gtk.png"
	install -Dm644 "resources/icon/full_color_128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/cadet-gtk.png"
	install -Dm644 "resources/icon/full_color_256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/cadet-gtk.png"
	install -Dm644 "resources/icon/full_color_512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/cadet-gtk.png"
	
	install -Dm644 "cadet-gtk.desktop" "$pkgdir/usr/share/applications/cadet-gtk.desktop"
}

