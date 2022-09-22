# Maintainer:Integral<luckys68@126.com>
pkgname=shimo-bin
_pkgname=shimo
pkgver=3.0.4
pkgrel=1
pkgdesc="石墨文档 Shimo document (An online collaborative office software)."
arch=('x86_64')
url="https://shimo.im/"
license=('custom')
depends=('nss' 'alsa-lib' 'java-runtime' 'libnet' 'gtk3' 'libxkbcommon-x11')
source=(
	"https://as.smvm.cn/panther/shimo/release/linux/x64/shimo_v${pkgver}-release.98ec8bb.shimo_linux-amd64.deb"
)
sha512sums=('ccebe1e6e8be1b6292a59c21aee5b24fae8ced93e6abb4f60850af9bb74696f816368224d886a979c245963ee2a20c737c89677c552af3c2574f7827b7e62aec')

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
