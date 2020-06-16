# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Henri van de Munt <(firstname) @ gmail.com>

pkgname=modustoolbox-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Set of multi-platform development tools by Cypress. IDE for PSoC 6"
arch=('x86_64')
license=(custom)
depends=('make' 'coreutils' 'perl' 'diffutils')
url="https://www.cypress.com/products/modustoolbox-software-environment"
options=('!strip')
source=("http://dlm.cypress.com.edgesuite.net/akdlm/downloadmanager/WICED_MODUS/P-ModusToolbox_2.0.0.1703-linux-install.tar.gz")


package() {
    cd "${srcdir}"

    install -d -m755 "${pkgdir}/opt/${pkgname}"

    cp -r "${srcdir}/ModusToolbox/" "${pkgdir}/opt/"

    # Create environment variable
    echo "export CY_TOOLS_PATHS=/opt/ModusToolbox/tools_2.0/" >> ${srcdir}/modustoolbox
    install -Dm644 "${srcdir}/modustoolbox" "${pkgdir}/etc/profile.d/modustoolbox"

    # Installing udev rules
    install -Dm644 "${srcdir}/ModusToolbox/tools_2.0/fw-loader/udev_rules/57-cypress_programmer.rules" "${pkgdir}/etc/udev/rules.d/57-cypress_programmer.rules"
    install -Dm644 "${srcdir}/ModusToolbox/tools_2.0/openocd/udev_rules/60-openocd.rules" "${pkgdir}/etc/udev/rules.d/60-opencd.rules"
    install -Dm644 "${srcdir}/ModusToolbox/tools_2.0/openocd/udev_rules/66-wiced-JTAG.rules" "${pkgdir}/etc/udev/rules.d/66-wiced-JTAG.rules"
    install -Dm644 "${srcdir}/ModusToolbox/tools_2.0/driver_media/67-wiced-JTAG.rules" "${pkgdir}/etc/udev/rules.d/67-wiced-JTAG.rules"
    install -Dm644 "${srcdir}/ModusToolbox/tools_2.0/driver_media/cypress_ftdi.sh" "${pkgdir}/opt/cypress/cypress_ftdi.sh"
    install -Dm644 "${srcdir}/ModusToolbox/tools_2.0/driver_media/cypress_cdc_acm.sh" "${pkgdir}/opt/cypress/cypress_cdc_acm.sh"

    # Install license
    install -Dm644 "${srcdir}/ModusToolbox/CYPRESS END USER LICENSE AGREEMENT.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    mkdir ${pkgdir}/opt/ModusToolbox/tools_2.0/modus-shell/bin
    # symbolic link to tools
    ln -sf /usr/bin/cat    ${pkgdir}/opt/ModusToolbox/tools_2.0/modus-shell/bin/cat
    ln -sf /usr/bin/cp     ${pkgdir}/opt/ModusToolbox/tools_2.0/modus-shell/bin/cp
    ln -sf /usr/bin/make   ${pkgdir}/opt/ModusToolbox/tools_2.0/modus-shell/bin/make
    ln -sf /usr/bin/mkdir  ${pkgdir}/opt/ModusToolbox/tools_2.0/modus-shell/bin/mkdir
    ln -sf /usr/bin/mktemp ${pkgdir}/opt/ModusToolbox/tools_2.0/modus-shell/bin/mktemp
    ln -sf /usr/bin/mv     ${pkgdir}/opt/ModusToolbox/tools_2.0/modus-shell/bin/mv
    ln -sf /usr/bin/perl   ${pkgdir}/opt/ModusToolbox/tools_2.0/modus-shell/bin/perl
    ln -sf /usr/bin/rm     ${pkgdir}/opt/ModusToolbox/tools_2.0/modus-shell/bin/rm
    ln -sf /usr/bin/rmdir  ${pkgdir}/opt/ModusToolbox/tools_2.0/modus-shell/bin/rmdir
    ln -sf /usr/bin/sh     ${pkgdir}/opt/ModusToolbox/tools_2.0/modus-shell/bin/sh
    ln -sf /usr/bin/bash   ${pkgdir}/opt/ModusToolbox/tools_2.0/modus-shell/bin/bash

    # Installing desktop shortcuts
    install -d -m755 "${pkgdir}/usr/share/applications"
cat <<EOF > "${pkgdir}/usr/share/applications/ModusToolbox-x86_64-${pkgver}.desktop"
[Desktop Entry]
Name=ModusToolbox
Version=${pkgver}
Comment=${pkgdesc}
GenericName=ModusToolbox
Exec=/opt/ModusToolbox/ide_2.0/eclipse/ModusToolbox
Icon=/opt/ModusToolbox/ide_2.0/eclipse/icon.xpm
Path=/opt/ModusToolbox/ide_2.0/eclipse/
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
EOF
}
md5sums=('13e885525b05058f2b8b6eee59323381')
