# Maintainer: David Rodriguez <dissonant.tech@gmail.com>

pkgname=pam_usb
pkgver=0.5.0
pkgrel=4
pkgdesc="PAM modules that enables either two-factor or password-less authentication using an USB storage device (such as an USB flash memory stick)"
url="https://github.com/aluzzardi/pam_usb"
license=("GPL")
depends=(libxml2 pam pmount udisks dbus-python pygobject)
arch=('i686' 'x86_64')
backup=('etc/pamusb.conf')
md5sums=('df8404aeb625eca1d3cad7a67d35f225')
source=(https://github.com/aluzzardi/$pkgname/archive/$pkgver.tar.gz)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make LIBS="`pkg-config --libs libxml-2.0` `pkg-config --libs dbus-1` -lpam" || return 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PAM_USB_DEST="$pkgdir/usr/lib/security" install
    sed -i 1s/python/python2/ "$pkgdir/usr/bin/pamusb-"{agent,conf}
}
