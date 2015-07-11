# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
_pkgbasename=fluidsynth
pkgname=lib32-lib$_pkgbasename
pkgver=1.1.6
pkgrel=1
pkgdesc="Library to handle real-time software synthesis based on the SoundFont 2 specifications. (32 bit)"
arch=('x86_64')
url="http://www.fluidsynth.org/"
license=('LGPL')
depends=('lib32-libxml2' 'lib32-portaudio' 'lib32-libpulse')
optdepends=('lib32-lash')
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/$_pkgbasename/$_pkgbasename-$pkgver.tar.gz")
md5sums=('ae5aca6de824b4173667cbd3a310b263')

build() {
	export CC='gcc -m32'
	export CXX='g++ -m32'
	
	cd "$srcdir/$_pkgbasename-$pkgver"
	./configure --prefix=/usr --libdir=/usr/lib32
	make
}

package() {
	cd "$srcdir/$_pkgbasename-$pkgver"
	make DESTDIR="${pkgdir}" install
	
	rm -rf "${pkgdir}/usr"/{bin,include,share}
}

