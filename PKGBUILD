# Maintainer: pzl <alsoelp@gmail.com>
# Contributor: Nicolas Avrutin <nicolasavru@gmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=hidapi-git
pkgver=374.a6a622f
pkgrel=1
pkgdesc="A Simple library for communicating with USB and Bluetooth HID devices."
arch=(any)
url="http://www.signal11.us/oss/hidapi/"
license=('GPL3' 'BSD' 'custom')
depends=('systemd-tools' 'libusb' 'fox')
conflicts=('hidapi')
provides=('hidapi')
makedepends=('git')
options=('!libtool')

source=("$pkgname"::"git://github.com/signal11/hidapi")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/$pkgname"
    ./bootstrap
    ./configure --enable-testgui --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
    install -D -m644 LICENSE-bsd.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-bsd.txt"
    install -D -m644 LICENSE-orig.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-orig.txt"
}
