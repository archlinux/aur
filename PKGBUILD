# Maintainer: Integral <integral@member.fsf.org>

pkgname=js-design
pkgver=1.0.6
pkgrel=1
pkgdesc="即时设计 A professional UI design software tailored for Chinese designers."
arch=('x86_64' 'aarch64')
url="https://js.design/"
license=('LicenseRef-js-design')
depends=('nss' 'alsa-lib' 'gtk3')
optdepends=('libappindicator-gtk3: Allow js-design to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://img.js.design/assets/download/%E7%BB%9F%E4%BF%A1UOS/%E5%8D%B3%E6%97%B6%E8%AE%BE%E8%AE%A1_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::https://img.js.design/assets/download/%E7%BB%9F%E4%BF%A1UOS/%E5%8D%B3%E6%97%B6%E8%AE%BE%E8%AE%A1_arm64.deb")
sha512sums_x86_64=('010c279208dd73b525fec1714cf6de176d5e8b45b587c632e89cc22d14432a9a5208545cc6a3b6bfed2f6c12c5036c4159a6538834fa4d5160faf1d5027e3bed')
sha512sums_aarch64=('b6579f6df0d31d06f980a673f5c53939c5796eed36da938eefdfff1c36b7614242534302f417f509bf7a80a419e79c0359b23926c36cd58c83040edf8954c3e5')

package() {
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"

	# Launcher
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/apps/design.js.jsdesign/files/js.design" "${pkgdir}/usr/bin/${pkgname}"

	# Desktop Entry
	install -Dm644 "${pkgdir}/opt/apps/design.js.jsdesign/entries/applications/js.design.desktop" -t "${pkgdir}/usr/share/applications/"

	# Icon
	cp -a "${pkgdir}/opt/apps/design.js.jsdesign/entries/icons/" "${pkgdir}/usr/share/"

	# License
	install -Dm644 ${pkgdir}/opt/apps/design.js.jsdesign/files/{LICENSE.electron.txt,LICENSES.chromium.html} \
		-t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
