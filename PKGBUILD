pkgname=classicube-bin
_pkgname=ClassiCube-bin
pkgver=1.0.1
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
sha256sums_x86_64=('fcbb1f231c42d0d11307fd436dd73b99024658f2102cb837e332d0b5b22fee50'
                   '00a31731209dd0ed1ae09e1692053804c9cd75224af4c2cd29bdd65599ae8e0e')
sha256sums_aarch64=('fcbb1f231c42d0d11307fd436dd73b99024658f2102cb837e332d0b5b22fee50'
                    '00a31731209dd0ed1ae09e1692053804c9cd75224af4c2cd29bdd65599ae8e0e')
source_x86_64=("https://cdn.classicube.net/client/release/nix64/ClassiCube.tar.gz" "https://gitlab.com/linuxbombay/classicube/-/archive/$pkgver-$pkgrel/classicube-$pkgver-$pkgrel.tar.bz2")
source_armv7h=("https://cdn.classicube.net/client/release/rpi32/ClassiCube.tar.gz" "https://gitlab.com/linuxbombay/classicube/-/archive/$pkgver-$pkgrel/classicube-$pkgver-$pkgrel.tar.bz2")
source_aarch64=("https://cdn.classicube.net/client/release/rpi64/ClassiCube.tar.gz" "https://gitlab.com/linuxbombay/classicube/-/archive/$pkgver-$pkgrel/classicube-$pkgver-$pkgrel.tar.bz2")


package() {
	install -dm755 "$pkgdir/usr/share/games/ClassiCube"
	install -dm755 "$pkgdir/usr/share/pixmaps"
	install -dm755 "$pkgdir/usr/bin"
        cd $srcdir
        cp -r ClassiCube "$pkgdir/usr/share/games/ClassiCube"
	cd $srcdir/classicube-$pkgver-$pkgrel
	cp -r ./ "$pkgdir/usr/share/games/ClassiCube"
	cp -r "$pkgdir/usr/share/games/ClassiCube/classicube.svg" "$pkgdir/usr/share/pixmaps"

    # Link to binary
    ln -s "/usr/share/games/ClassiCube/classicube.sh" "$pkgdir/usr/bin/classicube"

    # Desktop Entry
    install -Dm644 "$srcdir/classicube-$pkgver-$pkgrel/ClassiCube.desktop" \
        "$pkgdir/usr/share/applications/ClassiCube.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/ClassiCube.desktop"
}
