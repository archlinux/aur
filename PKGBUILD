# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Asuka Minato
pkgname=cultivation-bin
pkgver=1.3.0
pkgrel=5
pkgdesc="A custom launcher designed to make it as easy as possible to proxy anime game traffic to private servers.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/NotThorny/Cultivation"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'gtk3'
	'webkit2gtk'
)
source=(
	"${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('1668169b6aa4165a6bc2a573189a9a5e1bab2ebfd9d9bf43218bcb34f8e2b6c6')
prepare() {
	bsdtar -xf "${srcdir}/data."*
}
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	cp -r "${srcdir}/usr/lib" "${pkgdir}/usr"
	_icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
		install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
			-t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
	done
}