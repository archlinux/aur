# Maintainer: Alexandr Boiko <4le34n at gmail dot com>

pkgname=accel-ppp-ipoe-dkms
_pkgname=accel-ppp
pkgver=1.12.0
pkgrel=1
pkgdesc='Accel-ppp ipoe kernel module sources'
arch=('i686' 'x86_64')
url='http://sourceforge.net/apps/trac/accel-ppp/'
license=('GPL')
depends=('dkms' 'lua51')
source=(http://sourceforge.net/projects/$_pkgname/files/$_pkgname-$pkgver.tar.bz2
        dkms.conf)

package() {
    cd "$srcdir"
    install -dm755 "$pkgdir/usr/src"
    cd "$_pkgname-$pkgver/drivers"
    cp -r ipoe "$pkgdir/usr/src/accel-ppp-ipoe-$pkgver"
    # Copy dkms.conf
    install -Dm0644 "$srcdir/dkms.conf" "$pkgdir/usr/src/accel-ppp-ipoe-$pkgver/dkms.conf"
    # Set name and version
    sed -e "s/@PKGNAME@/${pkgname}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/accel-ppp-ipoe-${pkgver}/dkms.conf
}

md5sums=('d0f2668e182ec99b64fcd6bc8fc2a19b'
         'f363b0f073f88de2a537dd1de0faab8b')
