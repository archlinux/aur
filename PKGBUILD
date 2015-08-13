# Maintainer Raansu <Gero3977@gmail.com>

_pkgname=dogecoindark-qt
pkgname=$_pkgname-git
_gitname=dogedsource
_binname=dogecoindark
pkgver=1
pkgrel=1
epoch=1
pkgdesc="DogeCoinDark is a new coin, that already fulfills the original ideals of crypto-currency: Decentralization, Anonymity, and just plain doge fun! GUI-QT version"
arch=('x86_64' 'i686')
url="http://dogecoindark.net/"
license=('MIT')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
provides=('dogecoindark-qt')
conflicts=('dogecoindark-qt')
install=$pkgname.install
source=("$pkgname.install" 
        "dogecoindark.desktop" 
        "git+https://github.com/doged/dogedsource.git")
sha256sums=('ebf7090ca1202e2c2ccd1aa5bb03e6ac911c458141a1cedda9b41f9c26c2602c' 
            '02fb4dfe9469629ed43afe64ab3b5c7d702da8c78865c529c942d5c347281b66' 
            'SKIP')

build() {
	cd "$_gitname"
	
	qmake-qt4
	
	make
}

package() {
	install -Dm644 "$_binname.desktop" "$pkgdir/usr/share/applications/$_binname.desktop"

	cd "$_gitname"
	install -Dm755 "$_binname-qt" "$pkgdir/usr/bin/$_binname-qt"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 "src/qt/res/icons/DogeCoinDark.png" "$pkgdir/usr/share/pixmaps/$_binname.png"
}
