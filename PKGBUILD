# Maintainer: Alexandr Boiko <4le34n at gmail dot com>

pkgname=accel-ppp-vlanmon-dkms
_pkgname=accel-ppp
pkgver=1.12.0
pkgrel=1
pkgdesc='Accel-ppp vlan_mon kernel module sources'
arch=('i686' 'x86_64')
url='http://sourceforge.net/apps/trac/accel-ppp/'
license=('GPL')
depends=('dkms' 'lua51')
source=(http://sourceforge.net/projects/$_pkgname/files/$_pkgname-$pkgver.tar.bz2
        dkms.conf)

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    install -dm755 "$pkgdir/usr/src"
    cd drivers
    cp -r vlan_mon "$pkgdir/usr/src/accel-ppp-vlanmon-$pkgver"
    # Copy dkms.conf
    install -Dm0644 "$srcdir/dkms.conf" "$pkgdir/usr/src/accel-ppp-vlanmon-$pkgver/dkms.conf"
    # Set name and version
    sed -e "s/@PKGNAME@/${pkgname}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/accel-ppp-vlanmon-${pkgver}/dkms.conf
}

md5sums=('d0f2668e182ec99b64fcd6bc8fc2a19b'
         'ecb9e73f9243d773949cab8f2de36fc9')
