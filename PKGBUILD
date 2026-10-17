# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7.0
pkgrel=1
epoch=1
_tag="v${pkgver}"
_srcdir="${_pkgname}-${pkgver}"
pkgdesc="Rust + ratatui + libmpv 驱动的键盘优先终端音乐播放器：多音源、歌词、本地音乐、下载、收藏与歌单。"
arch=("x86_64" "aarch64")
url="https://github.com/emoeem/voicefox"
license=("MIT")
options=(!debug)
depends=(
	"glibc"
	"hicolor-icon-theme"
	"libgcc"
	"openssl"
	"mpv"
)
optdepends=(
	"nodejs>=23.5.0: support for custom JS music source"
)
provides=("${_pkgname}=${epoch}:${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("${_pkgname}-${pkgver}-src.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/${_tag}/${_pkgname}-linux-x86_64.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/${_tag}/${_pkgname}-linux-aarch64.zip")
sha512sums=('52d128513149bed4c968edfbe8e8b13b33088dceb1840787e3d0e1d8fb9ff58de134e1bab5e84a46c735d1a1645d6797e8a2ac41575a8065627203ffc28acea3')
sha512sums_x86_64=('f79079f077f540fa2fd03c5fdc636abcf2a9607903de1d2c69bb689310281a3d86d0f4df1eb12be965de9bc89089a52c4a236afe3145c8e44922a2a0a52e9629')
sha512sums_aarch64=('dbac8027d5ec3f92a6681caca151f6bb386cbe9505fb52c790717c428b120132afc7bc8ed15dacfbbf9340f7abee170ec96363ca82231854c95d8d3d8b991497')

check() {
	"${srcdir}/${_pkgname}" --check-libmpv
}

package() {
	install -Dm755 "${_pkgname}" \
	    "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${_srcdir}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${_srcdir}/icons/512.png" \
		"${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
	install -Dm644 "${_srcdir}/icons/1024.png" \
		"${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"
	install -Dm644 "${_srcdir}/assets/${_pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
