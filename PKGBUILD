# Maintainer: trilader <trilader@schroedingers-bit.net>
pkgname=usbreset
pkgver=1.0.0
pkgrel=2
pkgdesc="A tool to reset USB devices"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://marc.info/?l=linux-usb&m=121459435621262&w=2"
license=('unknown')
depends=()
makedepends=()
checkdepends=()
optdepends=('usbutils: Support for resetting USB devices by VID:PID instead of /dev/bus/usb/*')

source=('usbreset.c'
        'usbreset-device'
        'reset-usb-after-suspend@.service')
sha256sums=('61b2a45152d4718c4b1962a872aba5f51cdd19e3b5d359004cc98f007fb7e556'
            '1f3136afdcfbe1d2792f5ac1835b7735f0a4fdffa74be523ec400ac4c313a590'
            '907933a2c78922f6680b4dd2af95cd367dd858a5cf10c90caad2ec53f9848745')

build() {
    cd "$srcdir"
    gcc -o usbreset usbreset.c
}

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/bin/" "$pkgdir/usr/lib/systemd/system"
    install -m755 usbreset "$pkgdir/usr/bin/"
    install -m755 usbreset-device "$pkgdir/usr/bin/"
    install -m644 reset-usb-after-suspend@.service "$pkgdir/usr/lib/systemd/system/"
}
