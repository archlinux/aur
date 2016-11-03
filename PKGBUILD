# Maintainer: Tarmo Heiskanen <turskii@gmail.com>

pkgname=triggerhappy
pkgver=0.5.0
pkgrel=1
pkgdesc="A lightweight hotkey daemon"
arch=('i686' 'x86_64')
url="https://github.com/wertarbyte/triggerhappy"
license=('GPL')
depends=('libsystemd')
makedepends=('git' 'linux-api-headers')
source=("https://github.com/wertarbyte/triggerhappy/archive/release/$pkgver.tar.gz")
md5sums=('2056cda4e9127cd375067f2cd3234616')

build() {
    cd "$srcdir/triggerhappy-release-$pkgver"
    make
}

package() {
    cd "$srcdir/triggerhappy-release-$pkgver"
    make DESTDIR="$pkgdir/" install

    install -D -m 644 -t "$pkgdir/etc/triggerhappy/triggers.d" "triggerhappy.conf.examples"
    install -D -m 644 -t "$pkgdir/usr/lib/systemd/system" "systemd/triggerhappy.service" "systemd/triggerhappy.socket"
    install -D -m 644 -T "udev/triggerhappy-udev.rules" "$pkgdir/usr/lib/udev/rules.d/97-triggerhappy.rules"

    mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}

