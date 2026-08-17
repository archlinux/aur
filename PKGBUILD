# Maintainer: kunkka19xx <nobita079x@gmail.com>
pkgname=look-bin
pkgver=0.6.11
pkgrel=1
pkgdesc="Keyboard-first, local-first launcher for apps, files, clipboard, and quick commands"
arch=('x86_64')
url="https://github.com/kunkka19xx/look"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg')
makedepends=('binutils' 'tar')
provides=('lookapp')
conflicts=('lookapp' 'look')
options=(!strip !debug)
source=("$pkgname-$pkgver.deb::https://github.com/kunkka19xx/look/releases/download/v${pkgver}/Look_${pkgver}_amd64.deb")
sha256sums=('32e54a89800f56eafffaa39696e16bba3fb5d62670cf30a126e29240e80c927f')
noextract=("$pkgname-$pkgver.deb")

package() {
    cd "$srcdir"
    ar x "$pkgname-$pkgver.deb"
    tar -xf data.tar.* -C "$pkgdir/"

    # Drop the Debian-specific copyright path into the Arch-standard licenses dir
    if [ -f "$pkgdir/usr/share/doc/lookapp/copyright" ]; then
        install -Dm644 "$pkgdir/usr/share/doc/lookapp/copyright" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
