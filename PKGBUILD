pkgname=classicube-bin
_pkgname=ClassiCube-bin
pkgver=1.3.8
pkgrel=1
scriptver=1.0.2
pkgdesc="Play ClassiCube, our sandbox block game inspired by other similar sandbox block games, today for free! Just click one of the buttons below to start playing!"
arch=('i686' 'x86_64' 'armv7l' 'aarch64')
url="https://www.classicube.net"
conflicts=('classicube' 'classicube-git')
license=('GPL')
depends=('sdl2' 'curl' 'openal' 'zenity' 'yad')
makedepends=('unzip')
sha256sums_i686=('14898035696235de9d23005f3f39abacd00d5d59bddfd5bc7e0a6f4bf01b1139'
                 '615820fbdd192dc75dc3982e632b29447d37cdad83f83047f1f7b99a4a679dd4')
sha256sums_x86_64=('23864376a661d706efc5185f8388fbf5efe120b7ba986c5e5b9e56fb3fae3251'
                   '615820fbdd192dc75dc3982e632b29447d37cdad83f83047f1f7b99a4a679dd4')
sha256sums_armv7l=('588f419c2be84d373e073d90d9616126ec248f9e6dd35635868304de616c293f'
                   '615820fbdd192dc75dc3982e632b29447d37cdad83f83047f1f7b99a4a679dd4')
sha256sums_aarch64=('1430c8b0d21022d06cd98377929e1c2aaa141b77c14469d677cd0fa9f2b04393'
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
