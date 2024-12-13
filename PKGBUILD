# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=open-tv
pkgver=1.2.0
pkgrel=1
pkgdesc='Fast & Simple IPTV app'
arch=('x86_64')
url='https://github.com/Fredolx/open-tv'
license=('GPL2')
depends=('ffmpeg' 'mpv' 'yt-dlp' 'libayatana-appindicator' 'librsvg' 'webkit2gtk-4.1')
makedepends=('npm' 'rust' 'dpkg')
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('8ea0275ac9077775ca7e43dc86b93cd716a0b1b43b58af436b95d7f8ececacf2c7665d0e259b8166615fb0ffcdff46b9addfa82f0346e7a92910599237ef5429')
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
