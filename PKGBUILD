# Maintainer:
pkgname=mcuxpresso-secure-provisioning
pkgver=8.0.0
pkgrel=1
epoch=
pkgdesc="The MCUXpresso Secure Provisioning Tool is a GUI-based application provided to simplify generation and provisioning of bootable executables on NXP MCU devices."
arch=('x86_64')
url="https://www.nxp.com/design/software/development-software/mcuxpresso-software-and-tools-/mcuxpresso-secure-provisioning-tool:MCUXPRESSO-SECURE-PROVISIONING"
license=('custom:"NXP"')
depends=('openssl' 'hidapi' 'libusb' 'libtiff5' 'libdecor')

_install_dir=/opt/nxp
_deb_name=${pkgname}-v8-1_amd64.deb
_binary_deb_name=${_deb_name}

source=("file://${_binary_deb_name}")
noextract=("${_binary_deb_name}")
sha512sums=('2aa4b2be5114b188dbc8ec4abf744bdb27b74470937f6e97028a8023a3f80b652a30c1d3393e1e0f007e945af51eef7ee6e3a5dbe9f32cee9d25bd44b6caace5')
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
