# Maintainer: Steve Engledow <steve@offend.me.uk>
pkgname=heroes
pkgver=0.21
pkgrel=3
pkgdesc="Heroes is similar to the Tron and Nibbles games of yore, but includes many graphical improvements and new game features."
url="http://heroes.sourceforge.net"
arch=(x86_64)
license=('GPL')
depends=()
makedepends=(libmikmod sdl)
source=("http://prdownloads.sourceforge.net/heroes/$pkgname-$pkgver.tar.gz"
        "http://prdownloads.sourceforge.net/heroes/$pkgname-data-1.5.tar.gz"
        "http://prdownloads.sourceforge.net/heroes/$pkgname-sound-tracks-1.0.tar.gz"
        "http://prdownloads.sourceforge.net/heroes/$pkgname-sound-effects-1.0.tar.gz"
        "http://prdownloads.sourceforge.net/heroes/$pkgname-hq-sound-tracks-1.0.tar.gz"
        "heroes-0.21.patch")
md5sums=('3238290f219bc978894ba472fac95298'
         '1a53e23b007f526a76df8bef97a41550'
         'bcde6137a4b21b7395fd3d84b42b7888'
         'f4defb80baf765fceac034a408f7ad2e'
         'dafb2ccfb08c132265262231d5655102'
         '7135a9e9a55d4db94d03185c38924d6b')

build() {
	cd "$pkgname-$pkgver"
	patch -p0 <../heroes-0.21.patch
	LDFLAGS=-lm ./configure --prefix=/usr
	make
    cd ..

    cd "$pkgname-data-1.5"
	./configure --prefix=/usr
    make
    cd ..

    cd "$pkgname-sound-tracks-1.0"
	./configure --prefix=/usr
    make
    cd ..

    cd "$pkgname-sound-effects-1.0"
	./configure --prefix=/usr
    make
    cd ..

    cd "$pkgname-hq-sound-tracks-1.0"
	./configure --prefix=/usr
    make
    cd ..
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
    cd ..

    cd "$pkgname-data-1.5"
	make DESTDIR="$pkgdir/" install
    cd ..

    cd "$pkgname-sound-tracks-1.0"
	make DESTDIR="$pkgdir/" install
    cd ..

    cd "$pkgname-sound-effects-1.0"
	make DESTDIR="$pkgdir/" install
    cd ..

    cd "$pkgname-hq-sound-tracks-1.0"
	make DESTDIR="$pkgdir/" install
    cd ..
}
