# Maintainer: RifsxD <33044977 plus rifsxd at users dot noreply dot github dot com>

pkgname=pacextractor-git
_pkgname=pacextractor
pkgver=1.0.0.6e4ace5.git
pkgrel=1
pkgdesc='Extractor of SpreadTrum/UniSOC firmware files with .pac extension'
arch=('any')
url='https://github.com/rifsxd/pacextractor'
license=('Apache')
provides=('pacextractor-git')
conflicts=('pacextractor')
depends=()
makedepends=('make' 'gcc')
source=("git+$url.git")
sha256sums=('SKIP')

prepare(){
	cd "$_pkgname"
	COMMIT_HASH=$(git rev-parse HEAD) && COMMIT_HASH_SHORT="${COMMIT_HASH:0:7}.git" && EXISTING_VERSION=$(grep -oP '#define VERSION "\K[0-9]+\.[0-9]+\.[0-9]+' ./pacextractor.c) && VERSION="$EXISTING_VERSION.$COMMIT_HASH_SHORT" && sed -i "s/#define VERSION .*/#define VERSION \"$VERSION\"/" ./pacextractor.c
}

build() {
  	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	install -D "$_pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
