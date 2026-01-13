# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=open-tv
pkgver=1.9.0
pkgrel=2
pkgdesc='Fast & Simple IPTV app'
arch=('x86_64')
url='https://github.com/Fredolx/open-tv'
license=('GPL-2.0-only')
depends=('ffmpeg' 'mpv' 'yt-dlp' 'libayatana-appindicator' 'librsvg' 'webkit2gtk-4.1')
makedepends=('npm' 'rust' 'dpkg')
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('abd56a48a4f57f0831566efcaa16aeaa9c5060f7d5c4da3eb10a5cf04015b408fc664ee12cd20573467f43e511c90cb3a0efc1aa1a18baf5cefe9e195b834ebd')
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
	dpkg-deb -x "src-tauri/target/release/bundle/deb/Fred TV_${pkgver}_amd64.deb" "${pkgdir}"
}
