# Maintainer: dc <drachencomputer@gmail.com>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: Carl George <arch@cgtx.us>
# Contributor: Zohar Malamant <dotfloat@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Martin Erik Werner ("arand") <martinerikwerner@gmail.com>

pkgname=redeclipse
pkgver=2.0.0
pkgrel=1
pkgdesc="free, casual arena shooter"
arch=(i686 x86_64)
url="http://redeclipse.net"
license=("ZLIB" "CCPL:by-sa" "CCPL:by" "custom")
makedepends=(ed sdl2_mixer sdl2_image enet)
depends=(sdl2_image sdl2_mixer enet hicolor-icon-theme)
source=(https://github.com/redeclipse/base/releases/download/v2.0.0/redeclipse_2.0.0_combined.tar.bz2)
sha256sums=('a35d27368c4f63496e5b41be30c2084f39af38ea2fcdf4d8b0cdc6061b08b32d')

build() {
    cd "$pkgname-$pkgver"
    make -C src/ client server
}

package() {
    cd "$pkgname-$pkgver"
    make -C src/ DESTDIR="$pkgdir" prefix=/usr system-install
    install -Dm 0644 "doc/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -Dm 0644 "doc/all-licenses.txt" "$pkgdir/usr/share/licenses/$pkgname/all-licenses.txt"
}
