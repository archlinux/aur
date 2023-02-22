# Maintainer:Integral<luckys68@126.com>
pkgname=shimo-bin
_pkgname=shimo
pkgver=3.2.0
pkgrel=1
pkgdesc="石墨文档 Shimo document (An online collaborative office software)."
arch=('x86_64')
url="https://shimo.im/"
license=('custom')
depends=('nss' 'alsa-lib' 'java-runtime' 'libnet' 'gtk3' 'libxkbcommon-x11')
source=(
	"https://oas.shimonote.com/panther/shimo/release/linux/x64/${_pkgname}_v${pkgver}-release.32738d1.shimo_linux-amd64.deb"
)
sha512sums=('74b8c4bef2c385874075a89a08aa5286adceb32d4ea614365849138d0454445a086523fcbf3a4645dfdcb1d7b4e91c838335d49b0f7b0a494bd5ca0f7f521403')

package() {
	echo "  -> Extracting the data.tar.gz..."
	bsdtar -xvf data.tar.gz -C "${pkgdir}/"
	chmod -R 755 "${pkgdir}/"

	echo "  -> Installing..."
	# Launcher
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	# License
	install -Dm644 "${pkgdir}/opt/shimo/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/shimo/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
