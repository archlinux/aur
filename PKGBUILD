# Maintainer: Nik Rozman <admin[at]piskot[dot]si>
# Maintainer: Windscribe Limited <hello[at]windscribe[dot]com>
# Contributor: Nik Rozman <admin[at]piskot[dot]si>
# Contributor: Windscribe Limited <hello[at]windscribe[dot]com>

pkgname=windscribe-beta-bin
pkgver=2.5.18
pkgrel=1
pkgdesc="Windscribe Beta Client"
arch=('x86_64')
url="https://windscribe.com/download"
license=('GPL2')
depends=('nftables' 'c-ares' 'qt5-svg' 'freetype2' 'hicolor-icon-theme' 'curl' 'systemd')
conflicts=('windscribe-cli' 'windscribe-bin')
provides=('windscribe')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://deploy.totallyacdn.com/desktop-apps/2.5.18/windscribe_2.5.18_amd64.deb")
sha512sums=('SKIP')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Correct permissions
	chmod -R 755 "${pkgdir}"

	# Point files to the correct location
	sed -i 's_/usr/local/windscribe_/opt/windscribe_g' ${pkgdir}/usr/share/applications/windscribe.desktop
	sed -i 's_/usr/local/windscribe_/opt/windscribe_g' ${pkgdir}/etc/systemd/system/windscribe-helper.service
	sed -i 's_/usr/local/windscribe_/opt/windscribe_g' ${pkgdir}/usr/polkit-1/actions/com.windscribe.authhelper.policy

	# Move files to correct location
	mkdir -p "${pkgdir}/opt/windscribe"
	mv "${pkgdir}/usr/local/windscribe" "${pkgdir}/opt/"

	# Install license
	install -D -m644 "${pkgdir}/opt/windscribe/open_source_licenses.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}