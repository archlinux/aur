# Maintainer: Integral <integral@member.fsf.org>

pkgname=codemao-wood-uos
pkgver=0.1.3
pkgrel=1
pkgdesc="海龟编辑器 Turtle Editor (An editor tailed for programming for kids)."
arch=('x86_64')
url="https://python.codemao.cn/"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib')
source=(
	"https://home-store-packages.uniontech.com/appstore/pool/appstore/c/cn.codemao.wood/cn.codemao.wood_${pkgver}_amd64.deb"
)
sha512sums=('95251a01149c92f4db220c4ff0cfa5178122bd691fbfe4ace2c2da958f9d351f4ab1f692f5187a6342e5ae1c626dacff61fba5d5d45cef54ed0510997e179dcc')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"
	chmod -R 755 "${pkgdir}/"

	echo "  -> Installing..."
	# Launcher
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/apps/cn.codemao.wood/files/cn.codemao.wood" "${pkgdir}/usr/bin/${pkgname}"
	# Desktop Entry
	sed -i '4{s/$/ --no-sandbox/g}' "${pkgdir}/opt/apps/cn.codemao.wood/entries/applications/cn.codemao.wood.desktop"
	install -Dm644 "${pkgdir}/opt/apps/cn.codemao.wood/entries/applications/cn.codemao.wood.desktop" -t "${pkgdir}/usr/share/applications/"
	# License
	install -Dm644 "${pkgdir}/opt/apps/cn.codemao.wood/files/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/apps/cn.codemao.wood/files/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
