# Maintainer: Integral <integral@member.fsf.org>

pkgname=bcm-convertor-uos
pkgver=1.3.0
pkgrel=1
pkgdesc="编程猫格式工厂 (A tool software to compile source code of codemao-kitten3-uos into applications)."
arch=('x86_64')
url="https://shequ.codemao.cn/"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib')
source=(
	"https://home-store-packages.uniontech.com/appstore/pool/appstore/b/bcm-convertor.yzf/bcm-convertor.yzf_${pkgver}_amd64.deb"
)
sha512sums=('d2e8064f025f75e64b91698124a52def2d1dd165df0d1c239453af28a511631e95bbf36af17eec26da83177a00ebef87c9356cd7cd0b2f9a3a5c78885995e3ed')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"
	chmod -R 755 "${pkgdir}/"

	echo "  -> Installing..."
	# Launcher
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/apps/bcm-convertor.yzf/files/bcm_convertor" "${pkgdir}/usr/bin/${pkgname}"
	# Desktop Entry
	install -Dm644 "${pkgdir}/opt/apps/bcm-convertor.yzf/entries/applications/bcm-convertor.yzf.desktop" -t "${pkgdir}/usr/share/applications/"
	# Icon
	cp -r "${pkgdir}/opt/apps/bcm-convertor.yzf/entries/icons" "${pkgdir}/usr/share/"
	chmod -R 755 "${pkgdir}/usr/share/icons/"
	# License
	install -Dm644 "${pkgdir}/opt/apps/bcm-convertor.yzf/files/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/apps/bcm-convertor.yzf/files/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
