# Maintainer: silentnoodle <silentnoodle at cock dot li>
_pkgname=steal
pkgname="${_pkgname}-git"
pkgver=r73.942a873
pkgrel=1
pkgdesc="Free and OpenSource game-center/bittorrent client"
arch=("x86_64")
url="https://github.com/AbdelrhmanNile/steal"
licence=("GLP")
depends=(python python-kivy python-pandas python-pebble sharutils fuse-overlayfs xclip zstd npm wine-staging webtorrent-cli dwarfs-bin)
makedepends=()
source=(git+$url)
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	cp "${_pkgname}.basis" "$_pkgname"
	tar cf "${_pkgname}.tar" main.py "${_pkgname}_db_api.py" "${_pkgname}.kv"
	uuencode ${_pkgname}.tar ${_pkgname}.tar >> ${_pkgname}
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
