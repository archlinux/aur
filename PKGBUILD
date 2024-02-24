# Maintainer: Your Name <youremail@domain.com>
pkgname=dataflare-bin
pkgver=1.2.0 # from https://twitter.com/DataflareApp
pkgrel=1
pkgdesc="Easily manage your Table, view Data, write SQL and run Query."
arch=(x86_64 aarch64)
url="https://dataflare.app/"
license=('private')
depends=(krb5
	hicolor-icon-theme
	cairo
	gdk-pixbuf2
	gtk3
	glibc
	libsoup
	gcc-libs
	webkit2gtk
	glib2
)
provides=(dataflare)
conflicts=(dataflare)
source_x86_64=("Dataflare-x86_64.AppImage::https://assets.dataflare.app/release/linux/x86_64/Dataflare.AppImage")
source_aarch64=("Dataflare-aarch64.AppImage::https://assets.dataflare.app/release/linux/aarch64/Dataflare.AppImage")
sha256sums_x86_64=('1e4e13e15e939718abfe23598afc0585440717b5bdc972977336e39985e6b41c')
sha256sums_aarch64=('42464654a608398949af2b08d20fcf4138189dd4c893e7766872f79a2d467e1f')

prepare() {
	chmod +x ./*.AppImage
	./*.AppImage --appimage-extract
	pushd squashfs-root
	rm -rf usr/share/glib-2.0
	rm -rf usr/lib
	rm usr/bin/xdg-open
}

package() {
	pushd squashfs-root
	cp -av usr/ $pkgdir/

	install -vDm644 *.desktop -t $pkgdir/usr/share/applications/
	install -vDm644 *.png -t $pkgdir/usr/share/pixmaps/
	find $pkgdir -type d -print -empty -delete
}
