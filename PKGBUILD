# Contributor: bender02 at archlinux dot us
# Contributor: serbalgi (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname=fuse-emulator
pkgver=1.5.0
pkgrel=1
pkgdesc="ZX Spectrum emulator."
arch=('i686' 'x86_64')
url="http://fuse-emulator.sourceforge.net/fuse.php"
license=("GPL")
depends=('gtk3' "libspectrum=1.4.1" 'sdl')
source=("http://downloads.sourceforge.net/sourceforge/fuse-emulator/fuse-$pkgver.tar.gz"
        "fuse-emulator.desktop")

build() {
	cd "fuse-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "fuse-$pkgver"
	make DESTDIR="$pkgdir" install
	install -D -m 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
#	install -D -m 644 "data/icons/256x256/fuse.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	for resolution in 16x16 32x32 48x48 64x64 128x128 256x256
	do
		install -D -m 644 "data/icons/$resolution/fuse.png" "$pkgdir/usr/share/icons/hicolor/$resolution/apps/$pkgname.png"
		install -D -m 644 "data/icons/$resolution/application-x-spectrum.png" "$pkgdir/usr/share/icons/hicolor/$resolution/mimetypes/application-x-spectrum.png"
	done
}

md5sums=('41523d1ebbbd4640698148e331c94c02'
         '0abe9522e8d0bcfa51997dbd6a602197')
