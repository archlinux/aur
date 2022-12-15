# Contributor: bender02 at archlinux dot us
# Contributor: serbalgi (AUR)
# Contributor: Daniel Menelkir (dmenelkir at gmail dot com)
# Maintainer: SanskritFritz (gmail)

pkgname=fuse-emulator-sdl
pkgver=1.6.0
pkgrel=3
pkgdesc="ZX Spectrum emulator (SDL GUI)."
arch=('i686' 'x86_64')
url="http://fuse-emulator.sourceforge.net/fuse.php"
license=("GPL")
depends=("libspectrum>1.4.3" 'sdl')
conflicts=('fuse-emulator')
source=("http://downloads.sourceforge.net/sourceforge/fuse-emulator/fuse-$pkgver.tar.gz"
				"https://gitlab.com/menelkir/fuseroms/-/archive/0.2/fuseroms-0.2.tar.gz"
        "$pkgname.desktop")
sha512sums=("5096b24b5b3d812942a7ad401b886b6a99f5493686912cb4aff18ede65404ae97a9bcafa6337aaed4378382f2a170918797d7d4570bb809476be5aa9fc625b8b"
				"16f0993e6237252893e4624733f6e609a02a7cd9a726976b6dbf3ef1f08b3bda36c5ebadb07ba5283326dce1f71be10ce1ef6601262aa11e1ddc94e958ab63ac"
				"46b59831fb2ce0da176b7db1a89c17e75ae45c7dfb459287d1f22e4bf4d107d6261ff9e04e1d76b5421f5106a4a64e10e7876069c13fa2a3a0dd4a56f61d5193")

build() {
	cd "fuse-$pkgver"
	./configure --prefix=/usr --without-gtk --with-sdl
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

	# Extra ROMs
	install -D -m 644 "$srcdir"/fuseroms-0.2/fuse-extra/* -t "$pkgdir"/usr/share/fuse/

}

