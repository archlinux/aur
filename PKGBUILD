# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor Jon Sturm <Jasturm002@aol.com>
# Contributor: mickael9 <mickael9@gmail.com>

pkgname=libticables
pkgver=1.3.4
pkgrel=2
pkgdesc="TI Link Cable Library"
arch=(i686 x86_64)
url=http://lpg.ticalc.org/prj_tilp/
license=(GPL2)
options=(!libtool)
install=$pkgname.install
source=(http://downloads.sourceforge.net/project/tilp/tilp2-linux/tilp2-1.17/${pkgname}2-$pkgver.tar.bz2
    69-$pkgname.rules)
sha256sums=('45cae91ad9ee1cc2ebc0f5865923ff77f1e0adf0793d3010eeb802efc140e5b0'
    'e14a08b6a0c03f55c0f44de79de8896f0be5e8f7ccd5dd94f800c798f4fe79f8')
sha512sums=('fbea9ed2041a04f79e02045d40e88a3ab20edc8d86ecef4ae6a181063f3609b8b2c3aeb2ce2f4508be56655accba60eab7379116ac341921f233f469eb99b461'
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
