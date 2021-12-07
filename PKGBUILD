# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=trackmap
pkgver=0.1.0
pkgrel=1
pkgdesc='Build garmin maps and pois around gpx tracks'
arch=('x86_64')
url='https://github.com/repomaa/trackmap-cli'
license=('MIT')
depends=('osmfilter' 'gpsbabel' 'mkgmap' 'gc' 'pcre' 'libxml2' 'libevent')
makedepends=('git' 'crystal' 'shards')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	shards install --production
}

build() {
	cd "$pkgname"
	shards build --production --release
}

package() {
	cd "$pkgname"
	install -Dm755 bin/trackmap-cli "$pkgdir/usr/bin/trackmap"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/trackmap/LICENSE"
}
