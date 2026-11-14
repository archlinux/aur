# Maintainer: abcabc0330 <liqiang0330@gmail.com>
# Contributor: abcabc0330 <liqiang0330@gmail.com>

pkgname=dsh-gtk
pkgver=0.1.2
pkgrel=2
pkgdesc="GTK3+WebKitGTK tray shell for the dsh web UI (front-end window only; install dsh backend separately, e.g. deepseek-harness-bin)"
arch=('x86_64')
url="https://github.com/abcabc0330/dsh-gtk"
license=('MIT')
install='dsh-gtk.install'
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedepends=('pkg-config')
provides=('dsh-gtk')
conflicts=('dsh-gtk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/abcabc0330/dsh-gtk/archive/v$pkgver.tar.gz")
sha256sums=('5f2c59b4db3d7c5280f665d24a19183f579de99579b81ad73d23594ad2a96610')


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
