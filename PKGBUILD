pkgname=classicube-bin
_pkgname=ClassiCube-bin
pkgver=1.3.7
pkgrel=1
scriptver=1.0.2
pkgdesc="Play ClassiCube, our sandbox block game inspired by other similar sandbox block games, today for free! Just click one of the buttons below to start playing!"
arch=('i686' 'x86_64' 'armv7l' 'aarch64')
url="https://www.classicube.net"
conflicts=('classicube' 'classicube-git')
license=('GPL')
depends=('sdl2' 'curl' 'openal' 'zenity' 'yad')
makedepends=('unzip')
sha256sums_i686=('7457556e8a0d4d64fca01b2f61d639aa5627431d20a952c5360e92530d805dd0'
                 '615820fbdd192dc75dc3982e632b29447d37cdad83f83047f1f7b99a4a679dd4')
sha256sums_x86_64=('aab2bc97afeadcd5a1dab539699d238355cda37ef94b9d3af17c65386eefb339'
                   '615820fbdd192dc75dc3982e632b29447d37cdad83f83047f1f7b99a4a679dd4')
sha256sums_armv7l=('e8abfeee868efcd23cdd23be8df9195cfcb2512518bcb8eea176bf8e560377f5'
                   '615820fbdd192dc75dc3982e632b29447d37cdad83f83047f1f7b99a4a679dd4')
sha256sums_aarch64=('6ea9a02df91f4b7a062525ae0c7628f5de0679727d5892657042c258252dca2b'
                    '615820fbdd192dc75dc3982e632b29447d37cdad83f83047f1f7b99a4a679dd4')
source_i686=(
"ClassiCube-i686.tar.gz::https://gitlab.com/linuxbombay/classicube/binaries/$pkgver/-/raw/main/ClassiCube-i686.tar.gz" 
"https://gitlab.com/linuxbombay/classicube/classicube/-/archive/$scriptver/classicube-$scriptver.tar.bz2")
source_x86_64=(
"ClassiCube-x64.tar.gz::https://gitlab.com/linuxbombay/classicube/binaries/$pkgver/-/raw/main/ClassiCube-x64.tar.gz" 
"https://gitlab.com/linuxbombay/classicube/classicube/-/archive/$scriptver/classicube-$scriptver.tar.bz2")
source_armv7l=(
"ClassiCube-arm7l.tar.gz::https://gitlab.com/linuxbombay/classicube/binaries/$pkgver/-/raw/main/ClassiCube-arm7l.tar.gz" 
"https://gitlab.com/linuxbombay/classicube/classicube/-/archive/$scriptver/classicube-$scriptver.tar.bz2")
source_aarch64=(
"ClassiCube-arm64.tar.gz::https://gitlab.com/linuxbombay/classicube/binaries/$pkgver/-/raw/main/ClassiCube-arm64.tar.gz"
"https://gitlab.com/linuxbombay/classicube/classicube/-/archive/$scriptver/classicube-$scriptver.tar.bz2")

package() {
	install -dm755 "$pkgdir/usr/share/games/ClassiCube"
	install -dm755 "$pkgdir/usr/share/pixmaps"
	install -dm755 "$pkgdir/usr/bin"
        cd $srcdir
        rm -rf "$srcdir/ClassiCube/install-desktop-entry.sh"
        cp -r ClassiCube "$pkgdir/usr/share/games/"
	cd $srcdir/classicube-$scriptver
	cp -r ./ "$pkgdir/usr/share/games/ClassiCube"
	cp -r "$pkgdir/usr/share/games/ClassiCube/classicube.svg" "$pkgdir/usr/share/pixmaps"

    # Link to binary
    ln -s "/usr/share/games/ClassiCube/classicube.sh" "$pkgdir/usr/bin/classicube"

    # Desktop Entry
    install -Dm644 "$srcdir/classicube-$scriptver/ClassiCube.desktop" \
        "$pkgdir/usr/share/applications/ClassiCube.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/ClassiCube.desktop"
}
