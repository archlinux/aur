#Maintainer: Eshton Robateau <eshtonrob@gmail.com>
pkgname=cleps-video-player
pkgver=0.21.3
pkgrel=1
epoch=
pkgdesc="Cleps Video Player is a lightweight media player"
arch=('i686' 'x86_64')
url="https://github.com/yungtrizzle/cleps-video-player"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia')
optdepends=("gstreamer0.10-plugins: plugins to play different video formats")
makedepends=('automoc4' 'cmake')
changelog=
source=(https://github.com/yungtrizzle/cleps-video-player/archive/${pkgver}.tar.gz)
noextract=()
md5sums=('d248a9c65c4f3a185c29bb4e3d95deab')

prepare(){
mkdir -p build
}

build() {
	cd build
	cmake ../$pkgname-$pkgver \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr \
	
	make 
}


package() {
	cd build
        make DESTDIR="$pkgdir/" install
	cd "$srcdir/$pkgname-${pkgver}"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "cleps.png" "$pkgdir/usr/share/pixmaps/cleps.png"
}
