# Contributor : zico <zico@dxx-rebirth.com>
# Contributor: Dominic Radermacher <dominic.radermacher@gmail.com>
# Contributor: Star-X (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname=d2x-rebirth
pkgver=20220929
pkgrel=1
pkgdesc="An enhanced engine to play with Descent2 data."
arch=('x86_64')
url="https://www.dxx-rebirth.com/"
license=('custom:D2x' 'LGPL' 'custom:as-is')
depends=('sdl2' 'sdl2_mixer' 'mesa' 'physfs' 'sdl2_image')
makedepends=('scons' 'unzip')
install="$pkgname.install"
source=("https://www.dxx-rebirth.com/download/dxx/rebirth/dxx-rebirth_$pkgver-src.tar.xz"
        "https://www.dxx-rebirth.com/download/dxx/res/d2xr-sc55-music.dxa")
noextract=("d2xr-sc55-music.dxa")
md5sums=('0b941ed14b6a796fb8771fab20b128ae'
         'b5bd2bea4cf904d54bddad36222aa92f')

build() {
	cd "dxx-rebirth_$pkgver-src"
	scons sharepath="/usr/share/$pkgname" d2x=1 sdlmixer=yes opengl=yes sdl2=yes
}

package() {
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/$pkgname"
	mkdir -p "$pkgdir/usr/share/pixmaps"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

	install -m755 "dxx-rebirth_$pkgver-src/build/d2x-rebirth/d2x-rebirth" "$pkgdir/usr/bin/"

	install -m644 "dxx-rebirth_$pkgver-src/d2x-rebirth/d2x-rebirth.xpm" "$pkgdir/usr/share/pixmaps/"

	install -m644 "dxx-rebirth_$pkgver-src/d2x-rebirth/d2x-rebirth.desktop" "$pkgdir/usr/share/applications/"

	install -m644 "dxx-rebirth_$pkgver-src/COPYING.txt" "$pkgdir/usr/share/licenses/$pkgname/"
	install -m644 "d2xr-sc55-music.dxa" "$pkgdir/usr/share/$pkgname/"
} 
