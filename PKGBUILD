# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=open-tv
pkgver=1.8.3
pkgrel=1
pkgdesc='Fast & Simple IPTV app'
arch=('x86_64')
url='https://github.com/Fredolx/open-tv'
license=('GPL-2.0-only')
depends=('ffmpeg' 'mpv' 'yt-dlp' 'libayatana-appindicator' 'librsvg' 'webkit2gtk-4.1')
makedepends=('npm' 'rust' 'dpkg')
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ad5be5c88596060c3be7c45bb933f5f676bdc435c63d56cb40131e4b04bd207358c18e917ff483fe38f2c3020691fa7d4665fb3c0d87cf7bb39dfdb102d23674')
options=('!lto')

_srcdir="$pkgname-$pkgver"

build() {
	cd "$_srcdir"

	export npm_config_cache="$srcdir/npm-cache"

	npm install
	npm run -- tauri build -b deb
}

package() {
	cd "$_srcdir"
	dpkg-deb -x "src-tauri/target/release/bundle/deb/Open TV_${pkgver}_amd64.deb" "${pkgdir}"
}
