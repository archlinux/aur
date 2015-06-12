# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=fretscpp
pkgver=20130115
url=http://code.google.com/p/fretscpp/
pkgrel=1
pkgdesc="Frets on Fire (Free Rhythm Game) - rewritten in C++"
arch=(i686 x86_64)
license=('GPL')
depends=('libvorbis' 'libpng' 'mesa' 'sdl' 'libvpx')
makedepends=('git')
optdepends=('fretscpp-songs: songs for fretscpp')
provides=('fretscpp')

source=("${pkgname}-src::git://github.com/radu124/fretscpp.git"
        "$pkgname.desktop"
        "$pkgname.png")
        
md5sums=('SKIP'
         '68ebf5a34fb13d6d2a3a7f274cb53211'
         '3d444719ce2e76040e7e567250e99f94')

pkgver() {
	cd "$srcdir"/${pkgname}-src
	git log -1 --format=%cd --date=short | tr -d '-'
}

build() {
  cd "$srcdir"/${pkgname}-src
  
  make
}

package() {
	cd "$srcdir"/${pkgname}-src
	
	make DESTDIR="$pkgdir" install
	
	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	mkdir "$pkgdir/usr/share/applications"
	
	install -m644 README* "$pkgdir/usr/share/doc/$pkgname/"
	
	install -m644 ${srcdir}/fretscpp.png "$pkgdir/usr/share/games/fretscpp/"
	install -m644 ${srcdir}/fretscpp.desktop "$pkgdir/usr/share/applications/"
}






