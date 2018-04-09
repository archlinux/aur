# Maintainer: Martin Hasoň <martin.hason@gmail.com>

pkgname=scantailor-advanced
pkgver=1.0.12
pkgrel=1
pkgdesc="An interactive post-processing tool for scanned pages."
arch=("x86_64")
url="https://github.com/4lex4/scantailor-advanced"
license=("GPL3")
depends=("qt5-base" "hicolor-icon-theme" "boost-libs>=1.0.0" "libpng>=1.0.0" "zlib>=1.0.0" "libtiff>=4.0.0")
makedepends=("cmake>=3.9.0" "qt5-tools" "boost>=1.0.0")
source=("$pkgname-$pkgver::https://github.com/4lex4/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("a64f3e0c34f70963a9ffd19425f8d2b47069a9cda4dfd4037b47c8705ef4e90f")

build() {
    cd "$pkgname-$pkgver"
    cmake -G "Unix Makefiles"
    make -j`nproc`
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm0644 "resources/appicon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/scantailor-advanced.svg"
    install -Dm0644 "$srcdir/../scantailor-advanced.desktop" "$pkgdir/usr/share/applications/scantailor-advanced.desktop"
}
