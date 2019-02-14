
# Maintainer: Henri van de Munt <(firstname) @ gmail.com>

pkgname=modustoolbox
pkgver=1.0.0
pkgrel=2953
pkgdesc="ModusToolbox simplifies development for IoT designers. IDE for PSoC 6"
arch=('x86_64')
license=(custom)
depends=('make' 'coreutils' 'perl' 'diffutils')
url="https://www.cypress.com/products/modustoolbox-software-environment"
options=('!strip')

source=(http://dlm.cypress.com.edgesuite.net/akdlm/downloadmanager/software/ModusToolbox_${pkgver}.${pkgrel}-linux-install.tar.gz)
sha256sums=('88634f31893835ca72241084104664a6703535a1857052fd84c9b02e8976bf9a')

package() {
	cd "${srcdir}"

	install -d -m755 "${pkgdir}/opt/${pkgname}"

	cp -r "${srcdir}/ModusToolbox_1.0/." "${pkgdir}/opt/${pkgname}"

	# Installing udev rules
	install -Dm644 "${srcdir}/ModusToolbox_1.0/tools/openocd-1.0/udev_rules/60-openocd.rules" "${pkgdir}/etc/udev/rules.d/60-openocd.rules"
	install -Dm644 "${srcdir}/ModusToolbox_1.0/tools/openocd-1.0/udev_rules/66-wiced-JTAG.rules" "${pkgdir}/etc/udev/rules.d/66-wiced-JTAG.rules"

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
