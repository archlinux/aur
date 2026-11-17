# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wechat-kages-bin
_debname=otohime.wechat.kages
_zhsname='微信多重影'
pkgver=4.0
pkgrel=1
pkgdesc="This software supports WeChat multi-opening under the Linux system, which can be opened indefinitely."
arch=(
	'aarch64'
	'x86_64'
)
url="https://bbs.deepin.org/zh/post/295083"
_dlurl="https://github.com/kota-rina3/hokeshi"
license=('LicenseRef-unknown')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
	'glibc'
	'hicolor-icon-theme'
    'wechat-bin'
)
options=(
	'!strip'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_dlurl}/releases/download/${pkgname%-bin}-${pkgver}/${_debname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_dlurl}/releases/download/${pkgname%-bin}-${pkgver}/${_debname}_${pkgver}_amd64.deb")
sha256sums_aarch64=('ad7c9493a8285b19b89b311cdf7b4e4357c5f56a1aa0f7404bf5de7f035230c1')
sha256sums_x86_64=('be709ddbc64872ddcc2ef7041d6db9689622e58cee77db6c609c6e8e95184011')
prepare() {
	bsdtar -xf "${srcdir}/data."*
	sed -i -e "
		s/Exec=\/opt\/${_debname}\/${pkgname%-bin}/Exec=${pkgname%-bin}/g
		s/Icon=\/opt\/${_debname}\/kages.png/Icon=${pkgname%-bin}/g
	" "${srcdir}/usr/share/applications/${_zhsname}.desktop"
}
package() {
	install -Dm755 "${srcdir}/opt/${_debname}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/usr/share/applications/${_zhsname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_debname}/kages.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png"
}