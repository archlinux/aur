# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=cdgriffith
_pkgname=FastFlix
pkgname=${_pkgname,,}-bin
pkgver=5.12.4
pkgrel=1
pkgdesc="Simple and friendly GUI for encoding videos"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'zlib' 'ffmpeg')
makedepends=('icoutils')
optdepends=('nvenc: hardware accelerated encoding on NVIDIA cards'
			'x265: encoding to H265/HEVC'
			'x264: encoding to H264/AVC'
			'libwebp: encoding to WebP'
			'rav1e: encoding to AV1')

source=("FastFlix.desktop"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"FastFlix-${pkgver}.ico::${_urlraw}/fastflix/data/icon.ico")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_ubuntu-24.04_${arch[0]}.zip")
sha256sums=('cbcb6f228b858a69a860aa6a3283f0f4293e1246485566d20f60a93030f1f847'
            '416f7c9e5a6bc4d2dc3b61c95bc873bc6561d2ac601c305e91dd7a35d3225325'
            'ec9dbf695018bd84490fb27b39d1cc04d5339b91863595e78306164ec5688880')
sha256sums_x86_64=('61521d125a84f6fda766316a697c393a9f58eab35b20525015110937a6a9f7c2')


build() {
	icotool --extract --index=1 -o "FastFlix-${pkgver}.png" "FastFlix-${pkgver}.ico"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "FastFlix-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/FastFlix.png"

	install -Dm644 "${srcdir}/FastFlix.desktop" "${pkgdir}/usr/share/applications/FastFlix.desktop"
}
