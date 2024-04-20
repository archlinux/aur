# Maintainer: Integral <integral@member.fsf.org>
# Maintainer: ston <2424284164@qq.com>

pkgname=kdocs-uos
pkgver=3.7.7
pkgrel=3
pkgdesc="金山文档 Kingsoft documents (An online collaborative office software)."
arch=('x86_64')
url="https://www.kdocs.cn/"
license=('LicenseRef-Kingsoft')
depends=('dpkg' 'lsb-release' 'electron14')
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
            '409b2388be83ed2514d8c7a82a0064d74791f03131a7f1c33e81683c78c02bfa040f8c5e07fc8776a27e0aa18bdd94dadb9c410e5fc5e21f17642f60c20f0bec'
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

	# Remove unused files
	echo "  -> Removing unused files..."
	cd "${pkgdir}/opt/"
	find . -not -path */resources/* -type f -delete
	find . -xtype l -delete
	find . -empty -delete
}
