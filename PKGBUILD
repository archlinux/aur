# Maintainer: Masood Behabadi <masood@dentcat.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Henri van de Munt <(firstname) @ gmail.com>

pkgname=modustoolbox
pkgver=3.1.0
pkgrel=1
pkgdesc="Set of multi-platform development tools by Cypress. IDE for PSoC 6"
arch=('x86_64')
license=(custom)
depends=('make' 'coreutils' 'perl' 'diffutils' 'git'
	 'arm-none-eabi-binutils' 'arm-none-eabi-gcc' 'arm-none-eabi-gdb' 'arm-none-eabi-newlib')
url="https://www.cypress.com/products/modustoolbox-software-environment"
options=('!strip')
source=("https://download.cypress.com/downloadmanager/software/ModusToolbox/ModusToolbox_3.1/ModusToolbox_3.1.0.12257-linux-install.tar.gz")


package() {
    cd "${srcdir}"

    # Remove bundled ARM GNU Toolchain
    rm -r "${srcdir}/ModusToolbox/tools_3.1/gcc/"

    install -d "${pkgdir}/opt/${pkgname}/"
    cp -r ${srcdir}/ModusToolbox/* "${pkgdir}/opt/${pkgname}/"

    # Create environment variable
    echo "export CY_TOOLS_PATHS=/opt/modustoolbox/tools_3.1/" >> ${srcdir}/modustoolbox.sh
    install -Dm644 "${srcdir}/modustoolbox.sh" "${pkgdir}/etc/profile.d/modustoolbox.sh"

    # Installing udev rules
    install -Dm644 "${srcdir}/ModusToolbox/tools_3.1/fw-loader/udev_rules/57-cypress_programmer.rules" "${pkgdir}/etc/udev/rules.d/57-cypress_programmer.rules"
    install -Dm644 "${srcdir}/ModusToolbox/tools_3.1/openocd/udev_rules/60-openocd.rules" "${pkgdir}/etc/udev/rules.d/60-opencd.rules"
    install -Dm644 "${srcdir}/ModusToolbox/tools_3.1/openocd/udev_rules/66-wiced-JTAG.rules" "${pkgdir}/etc/udev/rules.d/66-wiced-JTAG.rules"
    install -Dm644 "${srcdir}/ModusToolbox/tools_3.1/driver_media/67-wiced-JTAG.rules" "${pkgdir}/etc/udev/rules.d/67-wiced-JTAG.rules"
    install -Dm644 "${srcdir}/ModusToolbox/tools_3.1/driver_media/cypress_ftdi.sh" "${pkgdir}/opt/cypress/cypress_ftdi.sh"
    install -Dm644 "${srcdir}/ModusToolbox/tools_3.1/driver_media/cypress_cdc_acm.sh" "${pkgdir}/opt/cypress/cypress_cdc_acm.sh"

    # Install license
    install -Dm644 "${srcdir}/ModusToolbox/CYPRESS END USER LICENSE AGREEMENT 3.1.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    mkdir ${pkgdir}/opt/${pkgname}/tools_3.1/modus-shell/bin
    # symbolic link to tools
    ln -sf /usr/bin/cat    ${pkgdir}/opt/${pkgname}/tools_3.1/modus-shell/bin/cat
    ln -sf /usr/bin/cp     ${pkgdir}/opt/${pkgname}/tools_3.1/modus-shell/bin/cp
    ln -sf /usr/bin/make   ${pkgdir}/opt/${pkgname}/tools_3.1/modus-shell/bin/make
    ln -sf /usr/bin/mkdir  ${pkgdir}/opt/${pkgname}/tools_3.1/modus-shell/bin/mkdir
    ln -sf /usr/bin/mktemp ${pkgdir}/opt/${pkgname}/tools_3.1/modus-shell/bin/mktemp
    ln -sf /usr/bin/mv     ${pkgdir}/opt/${pkgname}/tools_3.1/modus-shell/bin/mv
    ln -sf /usr/bin/perl   ${pkgdir}/opt/${pkgname}/tools_3.1/modus-shell/bin/perl
    ln -sf /usr/bin/rm     ${pkgdir}/opt/${pkgname}/tools_3.1/modus-shell/bin/rm
    ln -sf /usr/bin/rmdir  ${pkgdir}/opt/${pkgname}/tools_3.1/modus-shell/bin/rmdir
    ln -sf /usr/bin/sh     ${pkgdir}/opt/${pkgname}/tools_3.1/modus-shell/bin/sh
    ln -sf /usr/bin/bash   ${pkgdir}/opt/${pkgname}/tools_3.1/modus-shell/bin/bash
    ln -sf /usr/bin/git    ${pkgdir}/opt/${pkgname}/tools_3.1/modus-shell/bin/git

    mkdir -p ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin
    # Symbolic link to ARM GNU Toolchain
    ln -sf /usr/bin/arm-none-eabi-addr2line     ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-addr2line
    ln -sf /usr/bin/arm-none-eabi-ar            ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-ar
    ln -sf /usr/bin/arm-none-eabi-as            ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-as
    ln -sf /usr/bin/arm-none-eabi-c++           ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-c++
    ln -sf /usr/bin/arm-none-eabi-c++filt       ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-c++filt
    ln -sf /usr/bin/arm-none-eabi-cpp           ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-cpp
    ln -sf /usr/bin/arm-none-eabi-elfedit       ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-elfedit
    ln -sf /usr/bin/arm-none-eabi-g++           ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-g++
    ln -sf /usr/bin/arm-none-eabi-gcc           ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-gcc
    ln -sf /usr/bin/arm-none-eabi-gcc-ar        ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-gcc-ar
    ln -sf /usr/bin/arm-none-eabi-gcc-nm        ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-gcc-nm
    ln -sf /usr/bin/arm-none-eabi-gcc-ranlib    ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-gcc-ranlib
    ln -sf /usr/bin/arm-none-eabi-gcov          ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-gcov
    ln -sf /usr/bin/arm-none-eabi-gcov-dump     ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-gcov-dump
    ln -sf /usr/bin/arm-none-eabi-gcov-tool     ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-gcov-tool
    ln -sf /usr/bin/arm-none-eabi-gdb           ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-gdb
    ln -sf /usr/bin/arm-none-eabi-gdb-add-index ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-gdb-add-index
    ln -sf /usr/bin/arm-none-eabi-gprof         ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-gprof
    ln -sf /usr/bin/arm-none-eabi-ld            ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-ld
    ln -sf /usr/bin/arm-none-eabi-ld.bfd        ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-ld.bfd
    ln -sf /usr/bin/arm-none-eabi-lto-dump      ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-lto-dump
    ln -sf /usr/bin/arm-none-eabi-nm            ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-nm
    ln -sf /usr/bin/arm-none-eabi-objcopy       ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-objcopy
    ln -sf /usr/bin/arm-none-eabi-objdump       ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-objdump
    ln -sf /usr/bin/arm-none-eabi-ranlib        ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-ranlib
    ln -sf /usr/bin/arm-none-eabi-readelf       ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-readelf
    ln -sf /usr/bin/arm-none-eabi-size          ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-size
    ln -sf /usr/bin/arm-none-eabi-strings       ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-strings
    ln -sf /usr/bin/arm-none-eabi-strip         ${pkgdir}/opt/${pkgname}/tools_3.1/gcc/bin/arm-none-eabi-strip

    # Installing desktop shortcuts
    install -d -m755 "${pkgdir}/usr/share/applications"
cat <<EOF > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
[Desktop Entry]
Name=ModusToolbox
Version=${pkgver}
Comment=${pkgdesc}
GenericName=ModusToolbox
Exec=/opt/${pkgname}/ide_3.1/eclipse/modustoolbox-eclipse
Icon=/opt/${pkgname}/ide_3.1/eclipse/icon.xpm
Path=/opt/${pkgname}/ide_3.1/eclipse/
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
EOF
}
md5sums=('8a1778425993db520e8646f2e225de1c')
