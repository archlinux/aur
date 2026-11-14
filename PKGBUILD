# Maintainer: abcabc0330 <liqiang0330@gmail.com>
# Contributor: abcabc0330 <liqiang0330@gmail.com>

pkgname=dsh-gtk
pkgver=0.1.1
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
sha256sums=('1ebac49d034fe20283a8dc837a0358f89bfad9ac4ef4e8d30c01300327c638e4')


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
