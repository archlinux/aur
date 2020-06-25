# Maintainer: Richard Steinmetz <steinmetz.richard@googlemail.com>

pkgname=hidapi-git
pkgver=0.9.0.r57.g24a822c
pkgrel=1
pkgdesc='Simple library for communicating with USB and Bluetooth HID devices'
arch=(x86_64)
url='https://github.com/libusb/hidapi'
license=('GPL3' 'BSD' 'custom')
depends=('libusb')
makedepends=('git')
conflicts=('hidapi')
provides=('hidapi')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/hidapi\.//'
}

build() {
    cd "$srcdir/$pkgname"
    ./bootstrap
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    rm -f "${pkgdir}/usr/share/doc/hidapi/"LICENSE*
    install -m0644 LICENSE.txt LICENSE-bsd.txt LICENSE-orig.txt "$pkgdir/usr/share/licenses/$pkgname"
}
