# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Evangelos Paterakis <evan@geopjr.dev>

pkgname=collision
_app_id=dev.geopjr.Collision
pkgver=3.0.4
pkgrel=1
pkgdesc="Check hashes for your files. A simple GUI tool to generate, compare and verify MD5, SHA1 & SHA256 hashes"
arch=('x86_64')
url="https://github.com/GeopJr/Collision"
license=('BSD2')
depends=('libadwaita' 'libyaml')
makedepends=('crystal' 'gobject-introspection' 'gobject-introspection-runtime' 'shards' 'spglib' 'gettext')
conflicts=("$pkgname-hashes" "hashbrown")
replaces=("$pkgname-hashes" "hashbrown")
source=("${url}/archive/v${pkgver}.tar.gz")
_source=Collision
b2sums=('ba96fb31d3109a7ff4ee87ce0850a934f8be02b736691d0eddf4ddde6a341e04b9f4d9f5816e25562fe36b400ce332093a622829997a7b4eae3cb4fecc0df041')

build() {
  cd "$_source-$pkgver"
  make all
  make metainfo
}

check() {
  cd "$_source-$pkgver"
  make test
}

package() {
	cd "$_source-$pkgver"
	make PREFIX="$pkgdir/usr" install
	
	install -Dm644 "data/$_app_id.metainfo.xml" "$pkgdir/usr/share/metainfo/$_app_id.metainfo.xml"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
}
