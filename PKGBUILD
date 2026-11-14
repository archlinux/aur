# Maintainer: abcabc0330 <liqiang0330@gmail.com>
# Contributor: abcabc0330 <liqiang0330@gmail.com>

pkgname=dsh-gtk
pkgver=0.1.0
pkgrel=1
pkgdesc="Native GTK3 + WebKitGTK window for the dsh web UI with StatusNotifierItem tray residency"
arch=('x86_64')
url="https://github.com/abcabc0330/dsh-gtk"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedepends=('pkg-config')
provides=('dsh-gtk')
conflicts=('dsh-gtk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/abcabc0330/dsh-gtk/archive/v$pkgver.tar.gz")
sha256sums=('7eade0304178646f8a4b00b62f1eb26d31ab7e93d077ca8199e106980f8212a9')


prepare() {
    cd "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
    gcc -O2 -Wall -Wextra -o dsh-gtk dsh-gtk.c \
        $(pkg-config --cflags --libs gtk+-3.0 webkit2gtk-4.1 ayatana-appindicator3-0.1)
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 dsh-gtk "$pkgdir/usr/bin/dsh-gtk"
    install -Dm644 dsh-tray.png "$pkgdir/usr/share/dsh-gtk/dsh-tray.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
