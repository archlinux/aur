# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=dell-command-configure
pkgver=4.1.0
pkgrel=1
pkgdesc='Configure various BIOS features on Dell laptops'
arch=('x86_64')
url='https://www.dell.com/support/article/us/en/19/sln311302/dell-command-configure'
license=('unknown')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.dell.com/FOLDER04967312M/1/command-configure_${pkgver}-478.ubuntu16_amd64.tar.gz")
sha256sums=('d8eca8d98f0556340affabd298fa750a52cac20b7eead01f52f84d25e88d9eb3')

prepare() {
    ar xf srvadmin-hapi_*.deb
    mkdir srvadmin
    tar -xvf data.tar.xz -C srvadmin

    ar xf command-configure_*.deb
    mkdir command-configure
    tar -xvf data.tar.xz -C command-configure
}

package() {
    cp -a srvadmin/* "${pkgdir}"
    cp -a command-configure/* "${pkgdir}"

    ln -Tsf omreg.d/omreg-hapi.cfg "${pkgdir}/opt/dell/srvadmin/etc/omreg.cfg"

    mkdir -p "${pkgdir}/usr/bin"
    ln -Tsf /opt/dell/dcc/cctk "${pkgdir}/usr/bin/cctk"
}

# vim:set ts=4 sw=4 et:
