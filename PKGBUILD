
# Maintainer: Henri van de Munt <(firstname) @ gmail.com>

pkgname=modustoolbox
pkgver=1.1.0
pkgrel=234
pkgdesc="ModusToolbox simplifies development for IoT designers. IDE for PSoC 6"
arch=('x86_64')
license=(custom)
depends=('make' 'coreutils' 'perl' 'diffutils')
url="https://www.cypress.com/products/modustoolbox-software-environment"
options=('!strip')

source=(http://dlm.cypress.com.edgesuite.net/akdlm/downloadmanager/software/ModusToolbox/ModusToolbox_${pkgver}.${pkgrel}-linux-install.tar.gz)
sha256sums=('c968b4bba6fbe7209d7e075c15300451f67460ab057a12d040cf232ac3b248fd')

package() {
	cd "${srcdir}"

	install -d -m755 "${pkgdir}/opt/${pkgname}"

	cp -r "${srcdir}/ModusToolbox_1.1/." "${pkgdir}/opt/${pkgname}"

	# Installing udev rules
	install -Dm644 "${srcdir}/ModusToolbox_1.1/tools/openocd-2.1/udev_rules/60-openocd.rules" "${pkgdir}/etc/udev/rules.d/60-openocd.rules"
	install -Dm644 "${srcdir}/ModusToolbox_1.1/tools/openocd-2.1/udev_rules/66-wiced-JTAG.rules" "${pkgdir}/etc/udev/rules.d/66-wiced-JTAG.rules"

	# symbolic link to make
	ln -sf /usr/bin/make  ${pkgdir}/opt/modustoolbox/tools/modus-shell-1.0/bin/make
	
	# Installing desktop shortcuts
	install -d -m755 "${pkgdir}/usr/share/applications"
cat <<EOF > "${pkgdir}/usr/share/applications/ModusToolbox-x86_64-${pkgver}.desktop"
[Desktop Entry]
Name=ModusToolbox ${pkgver}
Comment=ModusToolbox ${pkgver}
GenericName=ModusToolbox
Exec=/opt/${pkgname}/eclipse/ModusToolbox
Icon=/opt/${pkgname}/eclipse/icon.xpm
Path=/opt/${pkgname}/eclipse/
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
EOF
}
