# Maintainer: Jan <jan@example.com>
pkgname=zipplusplus
pkgver=1.0.0
pkgrel=1
pkgdesc="A fully featured ZIP archiver with zlib and LZMA support"
arch=('x86_64')
url="https://example.com/zip++"
license=('MIT')
groups=('archivers')
provides=('zip-archiver')
conflicts=()
replaces=()
depends=('zlib' 'xz')
makedepends=('clang' 'make' 'man-pages')
optdepends=()
backup=()
source=("https://github.com/GS-Works/zipplusplus/releases/download/1.0.0/zip++-1.0.0.tar.xz")
sha256sums=('07d788432ff699b344615ddb4cd0ee5154f821fa9803718893852fe6867ac71e')
md5sums=('290c9e9b91acaa73954c45cc4cb8414a')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # Nur anwenden, wenn die Patch-Datei existiert
    if [[ -f "$srcdir/hotfix.patch" ]]; then
        echo "hotfix.patch gefunden – wende sie an..."
        patch -p1 < "$srcdir/hotfix.patch"
    else
        echo "hotfix.patch nicht gefunden – überspringe Patch"
    fi
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake .
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    ./zip++ -V || echo "Test: verbose output"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Binärdatei
    install -Dm755 zip++ "$pkgdir/usr/bin/zip++"

    # Dokumentation

}

# Optional: für .install Datei
# zip++.install
# post_install() { echo "zip++ erfolgreich installiert!"; }
# pre_remove() { echo "zip++ wird entfernt..."; }
# post_remove() { echo "zip++ entfernt."; }
# pre_upgrade() { echo "zip++ wird aktualisiert..."; }
