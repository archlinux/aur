# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=dell-command-configure
pkgver=4.4.0
pkgrel=1
pkgdesc='Configure various BIOS features on Dell laptops'
arch=('x86_64')
url='https://www.dell.com/support/article/us/en/19/sln311302/dell-command-configure'
license=('unknown')
source=("${pkgname}-${pkgver}.tar.gz::https://dl.dell.com/FOLDER06874350M/1/command-configure_${pkgver}-86.ubuntu18_amd64.tar.gz")
sha256sums=('618c6c4fecc62020f326aceb3c6b564cb5329d6085988472abed1deffaaae4a9')

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
