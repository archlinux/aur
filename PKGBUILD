# Maintainer:Integral<luckys68@126.com>
pkgname=js-design-bin
_pkgname=js-design
pkgver=1.0.6
pkgrel=1
pkgdesc="即时设计 A professional UI design software tailored for Chinese designers."
arch=('x86_64')
url="https://js.design/"
license=('custom')
depends=('nss' 'alsa-lib' 'gtk3')
optdepends=('libappindicator-gtk3: Allow js-design to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source=(
	"${_pkgname}-${pkgver}.deb::https://img.js.design/assets/download/%E7%BB%9F%E4%BF%A1UOS/%E5%8D%B3%E6%97%B6%E8%AE%BE%E8%AE%A1_amd64.deb"
)
sha512sums=('010c279208dd73b525fec1714cf6de176d5e8b45b587c632e89cc22d14432a9a5208545cc6a3b6bfed2f6c12c5036c4159a6538834fa4d5160faf1d5027e3bed')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"
	chmod -R 755 "${pkgdir}/"

	echo "  -> Installing..."
	# Launcher
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/apps/design.js.jsdesign/files/js.design" "${pkgdir}/usr/bin/${_pkgname}"
	# Desktop Entry
	install -Dm644 "${pkgdir}/opt/apps/design.js.jsdesign/entries/applications/js.design.desktop" -t "${pkgdir}/usr/share/applications/"
	# Icon
	cp -r "${pkgdir}/opt/apps/design.js.jsdesign/entries/icons/" "${pkgdir}/usr/share/"
	chmod -R 755 "${pkgdir}/usr/share/icons/"
	# License
	install -Dm644 "${pkgdir}/opt/apps/design.js.jsdesign/files/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/apps/design.js.jsdesign/files/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
