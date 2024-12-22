# Maintainer:
pkgname=mcuxpresso-secure-provisioning
pkgver=10
pkgrel=1
epoch=
pkgdesc="The MCUXpresso Secure Provisioning Tool is a GUI-based application provided to simplify generation and provisioning of bootable executables on NXP MCU devices."
arch=('x86_64')
url="https://www.nxp.com/design/software/development-software/mcuxpresso-software-and-tools-/mcuxpresso-secure-provisioning-tool:MCUXPRESSO-SECURE-PROVISIONING"
license=('custom:"NXP"')
depends=('openssl' 'hidapi' 'libusb' 'libtiff5' 'libdecor')

_install_dir=/opt/nxp
_deb_name=${pkgname}-v${pkgver}-${pkgrel}_amd64.deb
_binary_deb_name=${_deb_name}

source=("file://${_binary_deb_name}")
noextract=("${_binary_deb_name}")
sha512sums=('43a4cc1bb318d20c01379702c6b7f3ecad0e2e81590eb415b558b007c1432bf352156e095552673179188be8906c70d8d433d2612e2beb48db1627bb2104a873')
options=('!strip')

prepare() {
    cd ${srcdir}/
    ar xv ${_deb_name}
    bsdtar -x -f data.tar.gz
}

package() {
    mkdir -p ${pkgdir}${_install_dir}
    # main tool
    cp -ar ${srcdir}${_install_dir}/* ${pkgdir}${_install_dir};
    # udev rules
    mkdir -p ${pkgdir}/usr/lib/udev/rules.d/
    cp -ar ${srcdir}/etc/udev/rules.d/* ${pkgdir}/usr/lib/udev/rules.d;
    # desktop shortcut
    mkdir -p ${pkgdir}/usr/share/{applications,icons,mime}
    cp -ar ${srcdir}/usr/share/applications ${pkgdir}/usr/share/applications
    cp -ar ${srcdir}/usr/share/icons ${pkgdir}/usr/share/icons
    cp -ar ${srcdir}/usr/share/mime ${pkgdir}/usr/share/mime
}
