# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=open-tv
pkgver=1.8.0
pkgrel=1
pkgdesc='Fast & Simple IPTV app'
arch=('x86_64')
url='https://github.com/Fredolx/open-tv'
license=('GPL-2.0-only')
depends=('ffmpeg' 'mpv' 'yt-dlp' 'libayatana-appindicator' 'librsvg' 'webkit2gtk-4.1')
makedepends=('npm' 'rust' 'dpkg')
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('44384538d202f41cdca4dca410d839b4f3eed958ecd56896afd0b88a6bbebc5d02916f6f8bd3bc31a84c84efe7c3d68bd0555a15e2328a8a24178f1ff80a3fa8')
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
