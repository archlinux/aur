# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox-bin
_pkgname="${pkgname%-bin}"
pkgver=0.4.0
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
source=(
	"${_pkgname}-${pkgver}.zip::${url}/releases/download/${_tag}/${_pkgname}-linux-${CARCH}.zip"
	"${_pkgname}-${pkgver}-src.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz"
)
sha512sums=('026b21c1508eb475a9aaf7d4a648d01b9c53b327ffdd9f57644ce4228c77a0e16561ae207cdccce2bc451096fdbf860d1de669096084e01ed0d04037b9b3f408'
            'bc9eef98877514c10fb58fef620fd38613d6c64c6ddef7006200d0839f720e881cf5fbce05f8ba05b73390f73c8fb50f255c9aa9f4baa6997203a33e35db2b94')

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
