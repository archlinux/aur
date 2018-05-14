# Maintainer: Ben DeCamp <ben_decamp@outlook.com>
pkgname=mega-happy-sprite
pkgver=1.3.3
pkgrel=2
epoch=
pkgdesc="Sega Mega Drive (Genesis) Sprite Editor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://theadesilva.com/mega/"
license=()
groups=()
depends=('glibc' 'sdl')
makedepends=('gendesk' 'vim')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/ExtraordinaryBen/$pkgname/archive/v$pkgver.tar.gz)
noextract=()
md5sums=('d3cecc47bf81ed0c4a4e926226a14c13')

prepare() {
    gendesk -f -n --name='Mega Happy Sprite' --exec='mega' --pkgname "$pkgname" --pkgdesc "$pkgdesc"
    
}

build() {
    mv $srcdir/Mega-Happy-Sprite-$pkgver $srcdir/$pkgname-$pkgver
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -d "$pkgdir/usr/bin"
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
