# Maintainer: silentnoodle <silentnoodle at cock dot li>
_pkgname=steal
pkgname="${_pkgname}-git"
pkgver=r90.736bc20
pkgrel=2
pkgdesc="Free and OpenSource game-center/bittorrent client"
arch=("x86_64")
url="https://github.com/AbdelrhmanNile/steal"
licence=("GLP")
depends=(python python-kivy python-pandas python-pebble sharutils fuse-overlayfs xclip zstd npm wine-staging webtorrent-cli dwarfs-bin zpaq)
makedepends=()
source=(git+$url "${_pkgname}.desktop")
sha256sums=('SKIP'
            'c4b61d58df723c8bb71f173c415e86b157f65cc5f40d7984134861b59844e7e4')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	cp "${_pkgname}.basis" "$_pkgname"
	tar cf "${_pkgname}.tar" main.py "${_pkgname}_db_api.py"
	uuencode ${_pkgname}.tar ${_pkgname}.tar >> ${_pkgname}
}

package() {
    install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"	
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
