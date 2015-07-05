# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=spot-on
pkgver=2015.06.17
pkgrel=1
pkgdesc='An exploratory research project investigating a variety of communications protocols'
url='http://spot-on.sourceforge.net/'
arch=('i686' 'x86_64')
license=('custom:3-clause BSD')
depends=('qt5-base' 'geoip>=1.5.1' 'libgcrypt>=1.5' 'openssl>=0.9.8' 'lksctp-tools' 'qt5-multimedia' "libspoton=${pkgver}" 'libntru')
makedepends=('qt5-base' 'geoip>=1.5.1' 'libgcrypt>=1.5' 'openssl>=0.9.8' 'lksctp-tools' 'qt5-multimedia' 'qt5-tools' 'make' 'gcc')
source=("Spot-On-${pkgver}.tar.gz::http://downloads.sourceforge.net/project/spot-on/Version%20${pkgver}/Spot-On.tar.gz?r=")
sha256sums=('bc4b1feb7197497b6e46a7e0d0a54b355be08a65d77df93cd468a2095f517fe5')


build() {
    cd "$srcdir/spot-on.d/branches/trunk"
    qmake-qt5 -o Makefile spot-on.qt5.pro
    make
}

package () {
    cd "$srcdir/spot-on.d/branches/trunk"
    install -dm755 -- "$pkgdir/usr/lib/spot-on"
    install -m755 -- Spot-On "$pkgdir/usr/lib/spot-on/Spot-On"
    install -m755 -- Spot-On-Kernel "$pkgdir/usr/lib/spot-on/Spot-On-Kernel"
    install -dm755 -- "$pkgdir/usr/bin"
    ln -s ../lib/spot-on/Spot-On -- "$pkgdir/usr/bin/spot-on"
}

