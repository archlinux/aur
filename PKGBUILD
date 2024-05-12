# Maintainer: Integral <integral@member.fsf.org>

pkgname=codemao-kitten3-uos
pkgver=3.7.14
pkgrel=1
pkgdesc="源码编辑器 A code editor tailed for programming for kids."
arch=('x86_64')
url="https://kitten.codemao.cn/"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib')
optdepends=(
	'pulseaudio: PulseAudio sound server for codemao-kitten3-uos.'
	'alsa-lib: Shared library for ALSA applications.'
	'libgnome-keyring: GNOME keyring services library.'
	'lsb-release: Linux Standard Base version reporting utility.'
)
source=(
	"https://home-store-packages.uniontech.com/appstore/pool/appstore/c/cn.codemao.kitten3/cn.codemao.kitten3_${pkgver}_amd64.deb"
)
sha512sums=('f0da043950a495af69fbd22a58bbe672fa9d9d94a4bc6be6d8e38410ef14691b42c07077f0df05b6b5172f8e06537993c43ade7854bf3a16c633bd2b9fd60d00')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"
	chmod -R 755 "${pkgdir}/"

	echo "  -> Installing..."
	# Launcher
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/apps/cn.codemao.kitten3/files/Kitten3/Kitten3" "${pkgdir}/usr/bin/${pkgname}"
	# Desktop Entry
	install -Dm644 "${pkgdir}/opt/apps/cn.codemao.kitten3/entries/applications/cn.codemao.kitten3.desktop" -t "${pkgdir}/usr/share/applications/"
	# License
	install -Dm644 "${pkgdir}/opt/apps/cn.codemao.kitten3/files/Kitten3/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/apps/cn.codemao.kitten3/files/Kitten3/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
