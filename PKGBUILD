# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox-bin
_pkgname="${pkgname%-bin}"
pkgver=0.5.0
pkgrel=2
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
sha512sums=('2f3aa8851d9db6d76419b8329722f7975377d47bc6e32a181929968dee22f381ee803debc4bb4fb46da41f951f3aa4555cc157bb1246cb1451b0d662f2a2ed23')
sha512sums_x86_64=('f9618b59430d94014f5bcffe7fb7d32f19f1a9443818875dc2fb34b64a39e085ca3cc96211b16358e5ac2975afd9af96cff61d1306fa7542cbef3f9e63614d38')
sha512sums_aarch64=('dae277de5757264a39b73a3869342685f2292abaff1b941ac410afce7a6b4e4047d8870f8cd9bf60f23acd6840ce417fa3d6b030c90f35aab75750f13bc092e0')

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
