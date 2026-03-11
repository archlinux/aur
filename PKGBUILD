# Maintainer: Kyle Yasuda <suda@sudacode.com>

pkgname=subminer-bin
pkgver=0.5.6
pkgrel=2
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
provides=('subminer')
conflicts=('subminer')
source=(
	"SubMiner-${pkgver}.AppImage::https://github.com/ksyasuda/SubMiner/releases/download/v${pkgver}/SubMiner-${pkgver}.AppImage"
	"subminer::https://github.com/ksyasuda/SubMiner/releases/download/v${pkgver}/subminer"
	"subminer-assets.tar.gz::https://github.com/ksyasuda/SubMiner/releases/download/v${pkgver}/subminer-assets.tar.gz"
)
sha256sums=(
	'c91667adbbc47a0fba34855358233454a9ea442ab57510546b2219abd1f2461e'
	'85050918e14cb2512fcd34be83387a2383fa5c206dc1bdc11e8d98f7d37817e5'
	'210113be64a06840f4dfaebc22a8e6fc802392f1308413aa00d9348c804ab2a1'
)
noextract=("SubMiner-${pkgver}.AppImage")

package() {
	install -dm755 "${pkgdir}/usr/bin"

	install -Dm755 "${srcdir}/SubMiner-${pkgver}.AppImage" \
		"${pkgdir}/usr/lib/SubMiner/SubMiner.AppImage"
	install -dm755 "${pkgdir}/usr/lib/SubMiner"
	ln -s '/usr/lib/SubMiner/SubMiner.AppImage' "${pkgdir}/usr/bin/SubMiner.AppImage"

	install -Dm755 "${srcdir}/subminer" "${pkgdir}/usr/bin/subminer"

	install -Dm644 "${srcdir}/config.example.jsonc" \
		"${pkgdir}/usr/share/SubMiner/config.example.jsonc"
	install -Dm644 "${srcdir}/plugin/subminer.conf" \
		"${pkgdir}/usr/share/SubMiner/plugin/subminer.conf"
	install -Dm644 "${srcdir}/assets/themes/subminer.rasi" \
		"${pkgdir}/usr/share/SubMiner/themes/subminer.rasi"

	install -dm755 "${pkgdir}/usr/share/SubMiner/plugin/subminer"
	cp -a "${srcdir}/plugin/subminer/." "${pkgdir}/usr/share/SubMiner/plugin/subminer/"
}
