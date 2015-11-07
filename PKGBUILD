# Maintainer : Denis Salmanovich <denis.salmanovich@gmail.com>

pkgname=gctwimax-modacom-u3500
pkgver=1.0
pkgrel=1
pkgdesc="Linux driver for modacom-u3500 GCT Semiconductor WiMax chip. Used by mezon.lt in Lithuania"
arch=('i686' 'x86_64' 'armv6h')
url="https://code.google.com/p/gctwimax"
license=('custom')
depends=('libusb' 'libeap-modacom-u3500' 'usb_modeswitch' 'wpa_supplicant')
source=('http://gctwimax.googlecode.com/files/gctwimax-0.0.3rc4.tar.gz'
        'gctwimax-0.0.3rc4_libusb_context_fix.patch'
        'modacom-u3500.service')

build()
{
    cd ${srcdir}/gctwimax-0.0.3rc4
    patch -p1 < ${srcdir}/gctwimax-0.0.3rc4_libusb_context_fix.patch
    make
}
package()
{
    cd ${srcdir}/gctwimax-0.0.3rc4
    install -Dm755 gctwimax ${pkgdir}/usr/bin/gctwimax
    install -Dm644 ${srcdir}/modacom-u3500.service ${pkgdir}/usr/lib/systemd/system/modacom-u3500.service
    install -Dm755 src/event.sh ${pkgdir}/usr/share/gctwimax/event.sh
    install -Dm644 src/gctwimax.conf ${pkgdir}/usr/share/gctwimax/gctwimax.conf
}

md5sums=('55d643a2e18811207b96a31751dcd2ab'
         'f298ac40355f613b79c92d94bd20a7ce'
         '733eea0fcfc0464d23e9855199f4f558')