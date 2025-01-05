# Maintainer: Florian Weßel <florianwessel@gmx.net>

pkgname=comms-ublox
pkgver=2.9
pkgrel=4
pkgdesc='UBLOX (UBX) protocol definition, generated out of cc.ublox.commsdsl'
arch=('any')
url='https://github.com/commschamp/cc.ublox.commsdsl'
license=('MPL-2.0')
makedepends=('cmake' 'ninja' 'comms-dsl')
package=('comms')
source=("$pkgname-$pkgver.tar.gz::https://github.com/commschamp/cc.ublox.commsdsl/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8e0c4b09a76d4e570182a2a21a8315a680618a9bb7a50c32e841a171590fabb31fc3150e8ccf7641ef18efbe695daf3a1ae67a14a874b3cdc0630c3bb040a584')
b2sums=('5c0bbc5581325eb912293b34bb51f3d0ada906351d1b7bd6118bfa992b041013be4ee7afd64e37d9b9bd0967d1d35d761726f06686244783875cb6b708c4ad36')

build() {
    cd "cc.ublox.commsdsl-$pkgver"

    mkdir -p ../build

    # Create install dir
    mkdir -p ../usr

    cmake -B ../build -S . \
        -DCMAKE_INSTALL_PREFIX=../usr
    make -C ../build
}

package() {
    # create target directories
    install -d $pkgdir/usr/include
    install -d $pkgdir/usr/lib/cmake/cc_ublox

    # The ublox repo build the project as external project and has no install.
    cp -r usr/include/cc_ublox $pkgdir/usr/include
    cp -r usr/lib/cc_ublox/cmake/* $pkgdir/usr/lib/cmake/cc_ublox
}
