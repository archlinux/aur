# Maintainer: Integral <integral@member.fsf.org>
# Maintainer: ston <2424284164@qq.com>

pkgname=kdocs-uos
pkgver=3.7.7
pkgrel=1
pkgdesc="金山文档 Kingsoft documents (An online collaborative office software)."
arch=('x86_64')
url="https://www.kdocs.cn/"
license=('LicenseRef-Kingsoft')
depends=('nss' 'alsa-lib' 'gtk3' 'dpkg' 'lsb-release' 'electron')
optdepends=(
	'pulseaudio: A featureful, general-purpose sound server.'
	'lib32-libpulse: A featureful, general-purpose sound server (32-bit client libraries).'
	'gnome-keyring: Stores passwords and encryption keys.'
	'lsb-release: LSB version query program.'
)
source=(
	"https://home-store-packages.uniontech.com/appstore/pool/appstore/c/cn.kdocs.kdesktop/cn.kdocs.kdesktop_${pkgver}_amd64.deb"
	"kdocs-uos"
)
sha512sums=('17c258ebc99a1b1825a6c47485ea3e5934a634c281fd1c967ecfbca4d7b5052482ea9dbb793ba70530d827c83c248e31d9cda5c47083ce6d477827d41caeb367'
            'a107e3c596de8ce700d4f612a7b1e959e4f522017c11c569931bd1019a203ebf7b8b2af9f096f4a9fce7c55876b30ac3d9372f4c13146af8f444abdc23a600d5')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"
	chmod -R 755 "${pkgdir}/opt/"
	echo "  -> Installing..."

	# Launcher
	install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"

	# Desktop Entry
	install -Dm644 "${pkgdir}/opt/apps/cn.kdocs.kdesktop/entries/applications/cn.kdocs.kdesktop.desktop" -t "${pkgdir}/usr/share/applications/"

	# License
	install -Dm644 "${pkgdir}/opt/apps/cn.kdocs.kdesktop/files/lib/kdesktop/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/apps/cn.kdocs.kdesktop/files/lib/kdesktop/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
