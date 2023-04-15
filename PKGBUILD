# Maintainer: Alejandro Oranday <alejandro at oran dot day>
_name="r2modman"
pkgname="r2modman-bin"
pkgver=3.1.41
pkgrel=1
pkgdesc="A simple and easy to use mod manager for several games using Thunderstore."
arch=('x86_64')
url="https://github.com/ebkr/r2modmanPlus"
license=('MIT')
depends=(c-ares ffmpeg gtk3 http-parser libevent libvpx libxslt libxss minizip nss re2 snappy libnotify
libappindicator-gtk3)
provides=("r2modman")
conflicts=("r2modman")
source=("${url}/releases/download/v${pkgver}/${_name}-$pkgver.x86_64.rpm"
	"LICENSE")
md5sums=(
	'57700235209075cc515bf4fefa10a4ba'
	'cdc88d3d1b56736d0dbc702aaa7de854')

package() {
	mkdir -p ${pkgdir}/opt \
		${pkgdir}/usr/bin/ \
		${pkgdir}/usr/share/licenses/${pkgname}

	cp -a "${srcdir}/opt/${_name}" "${pkgdir}/opt/${_name}"
	install -Dm 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/."

	ln -s "/opt/${_name}/${_name}" "${pkgdir}/usr/bin/${_name}"

	install -Dm 644 "usr/share/applications/${_name}.desktop" \
		"${pkgdir}/usr/share/applications/${_name}.desktop"

	for icon_size in $(ls "${srcdir}/usr/share/icons/hicolor" | cut -d "x" -f 1); do
		install -Dm 644 "usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/${_name}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/${_name}.png"
	done
}
