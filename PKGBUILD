# Maintainer: Kyle Yasuda <suda@sudacode.com>

pkgname=subminer-bin
pkgver=0.19.6
pkgrel=1
pkgdesc='All-in-one sentence mining overlay with AnkiConnect and dictionary integration'
arch=('x86_64')
url='https://github.com/ksyasuda/SubMiner'
license=('GPL-3.0-or-later')
options=('!strip' '!debug')
depends=(
	'bun'
	'fuse2'
	'glibc'
	'mpv'
	'zlib-ng-compat'
)
optdepends=(
	'ffmpeg: media extraction and screenshot generation'
	'ffmpegthumbnailer: faster thumbnail previews in the launcher'
	'fzf: terminal media picker in the subminer wrapper'
	'rofi: GUI media picker in the subminer wrapper'
	'chafa: image previews in the fzf picker'
	'yt-dlp: YouTube playback and subtitle extraction'
	'mecab: optional Japanese metadata enrichment'
	'mecab-ipadic: dictionary for MeCab metadata enrichment'
	'python-guessit: improved AniSkip title and episode inference'
	'alass-git: preferred subtitle synchronization engine'
	'python-ffsubsync: fallback subtitle synchronization engine'
)
provides=("subminer=${pkgver}")
conflicts=('subminer')
source=(
	"SubMiner-${pkgver}.AppImage::https://github.com/ksyasuda/SubMiner/releases/download/v${pkgver}/SubMiner-${pkgver}.AppImage"
	"subminer-${pkgver}::https://github.com/ksyasuda/SubMiner/releases/download/v${pkgver}/subminer"
	"subminer-assets-${pkgver}.tar.gz::https://github.com/ksyasuda/SubMiner/releases/download/v${pkgver}/subminer-assets.tar.gz"
)
sha256sums=(
'1dafb9ee55e4eff2e5b0a0c8de772eab63b5d92ad677aeadfd742986e975b2dc'
'4786f3f81e5a43ae06350d0beedf06d62cb3ffd83843b0e7ffab187f4c797e3a'
'3e19d1b86d125a50a08a151e763b01652b342d073838120d8ced8dd5044abdaf'
)
noextract=("SubMiner-${pkgver}.AppImage")

package() {
	install -dm755 "${pkgdir}/usr/bin"

	install -Dm755 "${srcdir}/SubMiner-${pkgver}.AppImage" \
		"${pkgdir}/opt/SubMiner/SubMiner.AppImage"
	install -dm755 "${pkgdir}/opt/SubMiner"
	ln -s '/opt/SubMiner/SubMiner.AppImage' "${pkgdir}/usr/bin/SubMiner.AppImage"

	install -Dm755 "${srcdir}/subminer-${pkgver}" "${pkgdir}/usr/bin/subminer"

	install -Dm644 "${srcdir}/config.example.jsonc" \
		"${pkgdir}/usr/share/SubMiner/config.example.jsonc"
	install -Dm644 "${srcdir}/plugin/subminer.conf" \
		"${pkgdir}/usr/share/SubMiner/plugin/subminer.conf"
	install -Dm644 "${srcdir}/assets/themes/subminer.rasi" \
		"${pkgdir}/usr/share/SubMiner/themes/subminer.rasi"
	install -Dm644 "${srcdir}/assets/thumbnailers/subminer-ffmpegthumbnailer.thumbnailer" \
		"${pkgdir}/usr/share/SubMiner/thumbnailers/subminer-ffmpegthumbnailer.thumbnailer"

	install -dm755 "${pkgdir}/usr/share/SubMiner/plugin/subminer"
	cp -a "${srcdir}/plugin/subminer/." "${pkgdir}/usr/share/SubMiner/plugin/subminer/"
}
