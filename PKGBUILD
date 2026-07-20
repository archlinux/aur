# Maintainer: EliasofWaffle <eliascontato@protonmail.com>

pkgname=libspatialaudio
pkgver=0.4.1
pkgrel=1
pkgdesc="Spatial audio encoding/decoding and binauralization library"
license=('LGPLv2' 'Proprietary')
arch=('x86_64')
makedepends=(
	'git'
	'meson'
	'gcc'
	'libmysofa'
	)
depends=('libmysofa')
source=( https://github.com/videolan/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz )
sha256sums=('215980432e3980d7733caa7d5051887f0d604cb8a265adf1311087c0fe7d3892')

prepare(){
	cd libspatialaudio-0.4.1
        
	mkdir -p build
}

build(){

	arch-meson libspatialaudio-0.4.1 build 
	
	meson compile -C build

}

check() {
  	meson test -C build --print-errorlogs || true
}


package() {
	DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C build install

}

