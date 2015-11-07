# Maintainer : Denis Salmanovich <denis.salmanovich@gmail.com>

pkgname=libeap-modacom-u3500
pkgver=1.0
pkgrel=1
pkgdesc="Patched EAP Peer Library API for gctwimax-modacom-u3500 driver"
arch=('i686' 'x86_64' 'armv6h') 
url="https://code.google.com/p/gctwimax"
license=('custom')
depends=('dbus')
source=('http://hostap.epitest.fi/releases/wpa_supplicant-0.7.3.tar.gz'
        'wpa_supplicant-0.7.2-generate-libeap-peer.patch'
        'dbus-arch-deps.h')

build()
{
    cd ${srcdir}/wpa_supplicant-0.7.3
    patch -p1 < ${srcdir}/wpa_supplicant-0.7.2-generate-libeap-peer.patch
    make -C src/eap_peer
}
package()
{
    cd ${srcdir}/wpa_supplicant-0.7.3
    make DESTDIR="$pkgdir" -C src/eap_peer install
}

md5sums=('f516f191384a9a546e3f5145c08addda'
         '9a90a17b05029fbfeefa673b9a01724e'
         '31c5bb3c740fb7c754c3169354e12397')