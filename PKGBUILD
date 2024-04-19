# Maintainer: Integral <integral@member.fsf.org>
# Maintainer: ston <2424284164@qq.com>

pkgname=kdocs-uos
pkgver=3.7.7
pkgrel=2
pkgdesc="金山文档 Kingsoft documents (An online collaborative office software)."
arch=('x86_64')
url="https://www.kdocs.cn/"
license=('LicenseRef-Kingsoft')
depends=('nss' 'alsa-lib' 'gtk3' 'dpkg' 'lsb-release' 'electron')
optdepends=(
	'pulseaudio: A featureful, general-purpose sound server.'
	'lib32-libpulse: A featureful, general-purpose sound server (32-bit client libraries).'
	'gnome-keyring: Stores passwords and encryption keys.'
)
source=(
	"https://home-store-packages.uniontech.com/appstore/pool/appstore/c/cn.kdocs.kdesktop/cn.kdocs.kdesktop_${pkgver}_amd64.deb"
	"kdocs-uos"
	"cn.kdocs.kdesktop.desktop"
)
sha512sums=('17c258ebc99a1b1825a6c47485ea3e5934a634c281fd1c967ecfbca4d7b5052482ea9dbb793ba70530d827c83c248e31d9cda5c47083ce6d477827d41caeb367'
            'a107e3c596de8ce700d4f612a7b1e959e4f522017c11c569931bd1019a203ebf7b8b2af9f096f4a9fce7c55876b30ac3d9372f4c13146af8f444abdc23a600d5'
            '385b28c7acecfaa166181bb76b17c6c7395e5e6f68e4e397614e413a3bdc268c5a704f49450b4764175ce437acf73fac9edd5a6636bf3861b3f7358af9daac06')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"

	echo "  -> Installing..."
	# Launcher (Use System Electron)
	install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
	rm "${pkgdir}/opt/apps/cn.kdocs.kdesktop/files/lib/kdesktop/kdesktop"

	# Desktop Entry
	install -Dm644 "cn.kdocs.kdesktop.desktop" -t "${pkgdir}/usr/share/applications/"

	# Icons
	cp -r "${pkgdir}/opt/apps/cn.kdocs.kdesktop/entries/icons/" -t "${pkgdir}/usr/share/"

	# License
	install -Dm644 "${pkgdir}/opt/apps/cn.kdocs.kdesktop/files/doc/kdesktop/copyright" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	# Clean up unused files
	rm -rf "${pkgdir}/opt/apps/cn.kdocs.kdesktop/entries/"
	rm -rf ${pkgdir}/opt/apps/cn.kdocs.kdesktop/files/{bin,doc,lintian}
	rm "${pkgdir}/opt/apps/cn.kdocs.kdesktop/info"
}
