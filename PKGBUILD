# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox-bin
_pkgname="${pkgname%-bin}"
pkgver=0.9.1
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
	"openssl-3"
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
sha512sums=('434198eeabd7fc7ec46d934150ecabcc809a1811b45bcb4bc50858f64c9a5f45b79a4ee9e943961465f1fe7aa6e6ec8b0c41e917d13b3ba10c2635ac45dbb5c0')
sha512sums_x86_64=('c2471b827273d9444b7c56b4a650dc901681804a5499c01511bab3d12f538b61d69df087b7ea84dd3c335626f0a66df5634c33f3e6ba925a7264b05550e99beb')
sha512sums_aarch64=('5f7625f987a430c6fd5394ccda191c6873f7e4782d9aec7300fce48752f93704fc077aa62272cb26ed3dd406ef49e9816cd7a6ea21411e6894ec8438f91b337c')

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
