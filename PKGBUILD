# Maintainer: musiclover <musiclover382@protonmail.com>
# Contributor: Valerio Pizzi (pival81) <pival81@yahoo.com>

pkgname=mybsmart
pkgver=2
pkgrel=1
pkgdesc="Una piattaforma proprietaria di servizi e contenuti digitali per la scuola"
arch=("i686" "x86_64")
url="https://www.bsmart.it"
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'python-atspi' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
license=('custom')
source_i686=('LICENSE' "https://s3-eu-west-1.amazonaws.com/res.bsmart.it/mybsmart_desktop/releases/production_v${pkgver}/linux/ia32/MybSmart.deb")
source_x86_64=('LICENSE' "https://s3-eu-west-1.amazonaws.com/res.bsmart.it/mybsmart_desktop/releases/production_v${pkgver}/linux/x64/MybSmart.deb")
sha256sums_i686=('2ca3e6e7951873c7d82829299181838bb7cacb5c2ad372d7ce752d6d10543b39' '94336c9a82906d2f908721d43cae1154628a1547b36e8b4465520af809bbe005')
sha256sums_x86_64=('2ca3e6e7951873c7d82829299181838bb7cacb5c2ad372d7ce752d6d10543b39' '43df6ec5cf6cdce33d5adc3d0864c44fead985b54b147a53b3182d63dcd290b2')

package() {
	cd "${srcdir}"

	tar -xf data.tar.xz -C "${pkgdir}"

	mkdir "${pkgdir}"/usr/bin/

	# Link to the library
	ln -sf /opt/MybSmart/mybsmart "${pkgdir}"/usr/bin/mybsmart
 
	# SUID chrome-sandbox for Electron 5+
	chmod 4755 "${pkgdir}"/opt/MybSmart/chrome-sandbox || true
 
	# Install license
	# https://www.bsmart.it/pages/terminiecondizioni
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
