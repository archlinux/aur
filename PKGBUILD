# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8.1
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
sha512sums=('53426e807e5fbd2b6f0151c9cc150398ab6b51c65cba505b4d4f994a9d48b9f0070e50e62453665e69c1172b5c97fd26529291c782aff7135983c3943736b034')
sha512sums_x86_64=('7688bf1a645abfeec32075d2ee503a8af85e0be6e92c2dced3a37a689c6dacb0342770114f8e3b28bcc987fa264370287b527cbb9c37be21b85a7c48cc084004')
sha512sums_aarch64=('9e46cd1d0c3bd349eb7060cd9666822dab1d6833844a9d30fa4cddfa61065b0d0a2d0ee3b2f905fa93f9a63ecde2ec80df2d7445b0ee60b8fd4580f146e2068f')

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
