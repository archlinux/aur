pkgname=classicube-bin
_pkgname=ClassiCube-bin
pkgver=1.0.0
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_armv7h=1
_pkgrel_aarch64=1
pkgdesc="Play ClassiCube, our sandbox block game inspired by other similar sandbox block games, today for free! Just click one of the buttons below to start playing!"
arch=('x86_64' 'arm7h' 'aarch64')
url="https://www.classicube.net"
conflicts=("classicube-git")
license=('GPL')
depends=('curl' 'openal' 'zenity')
makedepends=('unzip')
sha256sums_x86_64=('SKIP' 'SKIP')
sha256sums_armv7h=('SKIP' 'SKIP')
sha256sums_aarch64=('SKIP' 'SKIP')
source_x86_64=("https://cdn.classicube.net/client/release/nix64/ClassiCube.tar.gz" "https://gitlab.com/classicubeaur/classicube-setupscript/-/archive/$pkgver-$pkgrel/classicube-setupscript-$pkgver-$pkgrel.tar.bz2")
source_armv7h=("https://cdn.classicube.net/client/release/rpi32/ClassiCube.tar.gz" "https://gitlab.com/classicubeaur/classicube-setupscript/-/archive/$pkgver-$pkgrel/classicube-setupscript-$pkgver-$pkgrel.tar.bz2")
source_aarch64=("https://cdn.classicube.net/client/release/rpi64/ClassiCube.tar.gz" "https://gitlab.com/classicubeaur/classicube-setupscript/-/archive/$pkgver-$pkgrel/classicube-setupscript-$pkgver-$pkgrel.tar.bz2")


package() {
	install -dm755 "$pkgdir/usr/share/games/ClassiCube"
	install -dm755 "$pkgdir/usr/share/pixmaps"
    cd $srcdir
    cp -r ClassiCube "$pkgdir/usr/share/games/ClassiCube"
	cd $srcdir/classicube-setupscript-$pkgver-$pkgrel
	cp -r ./ "$pkgdir/usr/share/games/ClassiCube"
	cp -r "$pkgdir/usr/share/games/ClassiCube/classicube.svg" "$pkgdir/usr/share/pixmaps"

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/share/games/ClassiCube/classicube.sh" "$pkgdir/usr/bin/classicube"

    # Desktop Entry
    install -Dm644 "$srcdir/classicube-setupscript-$pkgver-$pkgrel/ClassiCube.desktop" \
        "$pkgdir/usr/share/applications/ClassiCube.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/ClassiCube.desktop"
}