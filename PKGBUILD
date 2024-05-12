# Maintainer: Integral <integral@member.fsf.org>

pkgname=mastergo-uos
pkgver=1.2.1
pkgrel=1
pkgdesc="A professional UI/UX design software for teamwork."
arch=('x86_64')
url="https://mastergo.com/"
license=('custom')
depends=('nss' 'gtk3' 'python' 'alsa-lib')
source=(
	"https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.mastergo/com.mastergo_${pkgver}_amd64.deb"
)
sha512sums=('06fafdeb12b5196d7029a3a8179ab4697eb20fd1a81b790ff9e5db84d4c5479887d595f3dcf16a20b7bb7bd1fa6ef9ab3fdd9820eef7548f8b6ed8a88e060537')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"
	chmod -R 755 "${pkgdir}/"

	echo "  -> Installing..."
	# Launcher
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/apps/com.mastergo/files/master-desktop" "${pkgdir}/usr/bin/${pkgname}"
	# Desktop Entry
	install -Dm644 "${pkgdir}/opt/apps/com.mastergo/entries/applications/com.mastergo.desktop" -t "${pkgdir}/usr/share/applications/"
	# Icon
	install -Dm644 "${pkgdir}/opt/apps/com.mastergo/entries/icons/hicolor/scalable/apps/com.mastergo.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
	# License
	install -Dm644 "${pkgdir}/opt/apps/com.mastergo/files/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/apps/com.mastergo/files/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
