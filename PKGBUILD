# Maintainer: lxhillwind <lxhillwind@gmail.com>

pkgname=xorg-xbacklight-lxhillwind-patch
pkgver=1.2.1
pkgrel=1
pkgdesc="RandR-based backlight control application, with brightness represented as an integer."
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('xcb-util')
conflicts=('xorg-xbacklight')
groups=('xorg-apps' 'xorg')
source=("http://xorg.freedesktop.org/archive/individual/app/xbacklight-${pkgver}.tar.bz2"
        'percent_float_to_int.patch')
sha256sums=('17f6cf51a35eaa918abec36b7871d28b712c169312e22a0eaf1ffe8d6468362b'
            '539cbee55216729e7ef5dbffbb4de20c98677278a6c461fe7e78c3bf3dcba3a8')

build() {
    cd xbacklight-${pkgver}
    patch -Np0 -i $srcdir/percent_float_to_int.patch
    ./configure --prefix=/usr
    make
}

package() {
    cd xbacklight-${pkgver}
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

