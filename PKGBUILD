# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=open-tv
pkgver=1.7.0
pkgrel=1
pkgdesc='Fast & Simple IPTV app'
arch=('x86_64')
url='https://github.com/Fredolx/open-tv'
license=('GPL-2.0-only')
depends=('ffmpeg' 'mpv' 'yt-dlp' 'libayatana-appindicator' 'librsvg' 'webkit2gtk-4.1')
makedepends=('npm' 'rust' 'dpkg')
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7ab79d06223f6aaec1ebc94565333b1c162c8c10390cb85fae4d5a7dd82e21b0c9b77ad9e9b55fe8e4204f91f80ff537cf26d35112ae6470f0ea45ac224f3803')
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
