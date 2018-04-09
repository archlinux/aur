# Maintainer: Martin Hasoň <martin.hason@gmail.com>

pkgname=scantailor-advanced
pkgver=1.0.14
pkgrel=1
pkgdesc="An interactive post-processing tool for scanned pages."
arch=("x86_64")
url="https://github.com/4lex4/scantailor-advanced"
license=("GPL3")
depends=("qt5-base" "hicolor-icon-theme" "boost-libs>=1.0.0" "libpng>=1.0.0" "zlib>=1.0.0" "libtiff>=4.0.0")
makedepends=("cmake>=3.9.0" "qt5-tools" "boost>=1.0.0")
source=("$pkgname-$pkgver::https://github.com/4lex4/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("31f4f11bb2efc917fa74668f71d8f80ff5ef3a5b2fff85db38df324825b8943e")

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
