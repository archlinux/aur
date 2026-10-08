# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox-bin
_pkgname="${pkgname%-bin}"
pkgver=0.6.0
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
provides=("voicefox=${epoch}:${pkgver}")
conflicts=("voicefox" "voicefox-git")
source=("${_pkgname}-${pkgver}-src.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/${_tag}/${_pkgname}-linux-x86_64.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/${_tag}/${_pkgname}-linux-aarch64.zip")
sha512sums=('17c50c0d9001735a60e21a063da3d711d7726e6d0e9abfae5e092b90c8b746cd01d8340f7532d6f8dcebbf7af5c7e52e8ceb6b577d1249356a705b3ab6fcd7d3')
sha512sums_x86_64=('cbff90c26217f4820c27febf1b308454c1c51e9c98dd5aea66703183db0ba02c4bdbbd4d3ef91e25667824a6a553d21c00686bd06fc2935a10a139acbe2319ee')
sha512sums_aarch64=('bbc29796f0f231779c17233c8a40cff1bb210462d5e66e5d125951c138a45d4a9c5d1cd87e2ebc6733a580b836aa9fc30db627348881c3d940cb2e34aa8f14f8')

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
