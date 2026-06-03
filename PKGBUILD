# Maintainer: Kyle Yasuda <suda@sudacode.com>

pkgname=subminer-bin
pkgver=0.15.2
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
'964d86fde1661ce0c8dc7cf867dccb5eb6553b7115047261c7bff156a6e1ee4a'
'72b60f6e82bb6ce6c88e87c83716ee76aee26f28bb325330ec493aadcb82090d'
'72ff857326c2272554010599c47129b5bb31ecd53e8855dce767b163abc7276d'
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

	install -dm755 "${pkgdir}/usr/share/SubMiner/plugin/subminer"
	cp -a "${srcdir}/plugin/subminer/." "${pkgdir}/usr/share/SubMiner/plugin/subminer/"
}
