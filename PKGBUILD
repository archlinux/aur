# Maintainer: Dhruva Srinivas <dhruva******@gmail.com>

pkgname=remind-me-git
pkgver=2.0.0
pkgrel=1
pkgdesc="Lightweight system reminders for the command line"
arch=('x86_64')
url="https://github.com/carrotfarmer/remindme"
license=("MIT")
depends=("libnotify")
source=("$pkgname-$pkgver.tar.gz::https://github.com/carrotfarmer/remindme/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/remindme-$pkgver"
    make
}

package() {
    install -Dm755 "$srcdir/remindme-$pkgver/build/remindme" "$pkgdir/usr/local/bin/remindme"
    install -Dm755 "$srcdir/remindme-$pkgver/build/remindd" "$pkgdir/usr/local/bin/remindd"
    install -Dm644 "$srcdir/remindme-$pkgver/remindd.service" "$pkgdir/usr/lib/systemd/user/remindd.service"

    # Create /etc/.remindme and set permissions
    install -Dm644 /dev/null "$pkgdir/etc/.remindme"
    chmod 666 "$pkgdir/etc/.remindme"
}
