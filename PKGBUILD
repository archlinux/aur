# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8
pkgrel=2
pkgdesc="A TUI music player that supports both streaming and local tracks"
arch=("x86_64")
url="https://github.com/emoeem/voicefox"
license=("MIT")
options=(!lto) # ring's cc-compiled asm breaks with makepkg's -flto
depends=(
	"glibc"
	"libgcc"
	"openssl"
	"mpv"
	"nodejs"
)
provides=("voicefox=${pkgver}")
conflicts=("voicefox" "voicefox-git")
source=(
	"${url}/releases/download/${pkgver}/${_pkgname}-linux-${CARCH}.zip"
	"${_pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/emoeem/voicefox/refs/tags/${pkgver}/LICENSE"
)
sha512sums=('fbec2d87c93a8040a663e5b1d174e1fda471b6bd21511ee570b9787d96890e039f97f149b0c9c21c45ffea8dbe84da82defdedea3c72322f8c8c785632e26b5f'
            'e65d0d2522762bf43fa7c79e47c4b867dc7126e8402b8981ff6357b3d7e7968b34f9058d0426d24115a90bf4165bba86ce5414bd29f2df0355ebfa349e266814')

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" voicefox
	install -Dm644 "${_pkgname}-${pkgver}-LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
