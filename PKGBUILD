# Maintainer:Integral<luckys68@126.com>
pkgname=ydbg-bin
_pkgname=ydbg
pkgver=1.0.0
pkgrel=1
pkgdesc="移动办公 An office software for government & enterprise, developed by China Mobile."
arch=('x86_64')
url="https://zhengqi.10086.cn/hebangong/index.html"
license=('custom')
depends=('gtk3' 'libwebp' 'kwin' 'libbsd')
source=(
	"https://dlrcs.fetion-portal.com/pc/ydbg_v${pkgver}.deb"
)
sha512sums=('9e1b85eec2778e318a232d38b875b78f840872a76f7c33e41c5c44c02d52639d610ea6cff9a064ceb1bdb99bd3a7d18aa27163b60003c25f9ab7bae9109d78cf')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"
	chmod -R 755 "${pkgdir}/"

	echo "  -> Installing..."
	# Launcher
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/apps/com.cmic.yidongbangong/files/yidongbangong" "${pkgdir}/usr/bin/${_pkgname}"
	# Desktop Entry
	install -Dm644 "${pkgdir}/opt/apps/com.cmic.yidongbangong/entries/applications/com.cmic.yidongbangong.desktop" -t "${pkgdir}/usr/share/applications/"
	# Icon
	cp -r "${pkgdir}/opt/apps/com.cmic.yidongbangong/entries/icons/" "${pkgdir}/usr/share/"
	chmod -R 755 "${pkgdir}/usr/share/icons/"
	# License
	install -Dm644 "${pkgdir}/opt/apps/com.cmic.yidongbangong/files/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/apps/com.cmic.yidongbangong/files/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
