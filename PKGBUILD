# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor Jon Sturm <Jasturm002@aol.com>
# Contributor: mickael9 <mickael9@gmail.com>

pkgname=libticables
pkgver=1.3.5
pkgrel=1
pkgdesc="TI Link Cable Library"
arch=(i686 x86_64)
url=http://lpg.ticalc.org/prj_tilp/
license=(GPL2)
options=(!libtool)
depends=(libusb glib2)
install=$pkgname.install
source=(http://downloads.sourceforge.net/project/tilp/tilp2-linux/tilp2-1.18/${pkgname}2-$pkgver.tar.bz2
    69-$pkgname.rules)
sha256sums=('0c6fb6516e72ccab081ddb3aecceff694ed93aec689ddd2edba9c7c7406c4522'
            'e14a08b6a0c03f55c0f44de79de8896f0be5e8f7ccd5dd94f800c798f4fe79f8')
sha512sums=('171abdf41f496891c62da17a2b84d929ac32021b0f2abc0c37ed73ec93806d4a14df37a8ffbe2b0c172ff3461aa6c639fc1ba23aafb19e024b99448dd66c63bd'
            '423e0fcf072e7f4460ca00dedcc8839c3e22515f353813a058324dff0624c1eebcbd2385ca425fad351262520a30309d6d2a3148e4c0a5ec326eddb1428dbe1c')

build() {
    cd ${pkgname}2-$pkgver/
    autoreconf -fi
    ./configure --prefix=/usr --enable-libusb10
    make
}

package() {
    make -C ${pkgname}2-$pkgver DESTDIR="$pkgdir" install
    install -Dm644 69-$pkgname.rules "$pkgdir"/etc/udev/rules.d/69-$pkgname.rules
}
