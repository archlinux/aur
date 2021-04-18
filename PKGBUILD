# Maintainer: Noah Jelen <noahtjelen@gmail.com>

pkgname=cesium-editor-git
pkgver=0.2.0
pkgrel=1
pkgdesc="A bare bones text editor"
arch=('i686' 'x86_64')
url="https://gitlab.com/NoahJelen/cesium"
license=('GPL')
depends=('ncurses' 'gcc-libs' 'glibc')
makedepends=('cargo' 'gzip')
source=("git+https://gitlab.com/NoahJelen/cesium")
conflicts=('cesium-editor')
md5sums=('SKIP')

build() {
    cd "cesium"
    cargo build --release
}

package() {
    #the package contents
    cd "cesium"
    mkdir -p "$pkgdir/usr/lib/cesium"
    mkdir -p "$pkgdir/usr/share/man/man1/"
    install -Dt "$pkgdir/usr/bin" -m755 target/release/cesium
    install -Dt "$pkgdir/usr/share/applications/" cesium.desktop
    install -Dt "$pkgdir/usr/lib/cesium/" icon.png

    #the documentation
    install -Dt "$pkgdir/usr/share/man/man1" man/cesium.1
    gzip "$pkgdir/usr/share/man/man1/cesium.1"
}
