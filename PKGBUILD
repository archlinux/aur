# Maintainer: kunkka19xx <nobita079x@gmail.com>
pkgname=look-bin
pkgver=0.6.13
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
sha256sums=('c755a9312dfefb942cbbaf9ec303d346a3520b830e35339c57da09f10538cac4')
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
