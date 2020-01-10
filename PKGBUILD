# Maintainer: Giacomo Vercesi <mrjackv@hotmail.it>

pkgname=redeclipse-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="free, casual arena shooter"
arch=(i686 x86_64)
url="http://redeclipse.net"
license=("ZLIB" "CCPL:by-sa" "CCPL:by" "custom")
depends=(sdl2_image sdl2_mixer)
makedepends=(icoutils)
provides=('redeclipse')
conflicts=('redeclipse')
source=("https://github.com/redeclipse/base/releases/download/v$pkgver/redeclipse_${pkgver}_nix.tar.bz2"
        "redeclipse.desktop")
sha256sums=('b15c14214e4b86c232828b39d3531fa9217b41bc695892f10166aef746387190'
            '8bfccdd79fc24e923bc1fa3f120cc567e6eb841eaeeb4dc2628682a936465ed5')

prepare() {
    cd "redeclipse-$pkgver"
    mkdir -p cache
}

package() {
    install -Dm 0644 "redeclipse.desktop" "$pkgdir/usr/share/applications/redeclipse.desktop"
    cd "redeclipse-$pkgver"
    find bin -name '*.dll' -delete
    find bin -name '*.exe' -delete
    find . -name '*.bat' -delete
    rm -r bin/redeclipse.app
    cd src
    icotool -x redeclipse.ico
    cd ..

    install -Dm 0644 "doc/license.txt" "$pkgdir/usr/share/licenses/redeclipse/license.txt"
    install -Dm 0644 "doc/all-licenses.txt" "$pkgdir/usr/share/licenses/redeclipse/all-licenses.txt"
    install -Dm 0644 "src/redeclipse_8_512x512x32.png" "$pkgdir/usr/share/pixmaps/redeclipse.png"
    mkdir -p "$pkgdir/opt/redeclipse"
    cp -r "bin" "$pkgdir/opt/redeclipse"
    cp -r  "config" "$pkgdir/opt/redeclipse"
    cp -r  "data" "$pkgdir/opt/redeclipse"
    install -Dm 0755 "redeclipse.sh" "$pkgdir/opt/redeclipse"
    install -Dm 0755 "redeclipse_server.sh" "$pkgdir/opt/redeclipse"
}
