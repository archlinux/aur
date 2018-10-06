# Maintainer: Baudouin Feildel <baudouin_aur@feildel.fr>
pkgname=pgpointcloud
pkgver=1.2.0
pkgrel=1
pkgdesc="A PostgreSQL extension for storing point cloud (LIDAR) data"
arch=('i686' 'x86_64')
url="https://github.com/pgpointcloud/pointcloud"
license=('BSD')
depends=('libxml2')
optdepends=('laz-perf: LAZ compression support')
makedepends=('cunit' 'laz-perf')
provides=("pgpointcloud=$pkgver")
conflicts=('pgpointcloud-git')
changelog="$pkgname.changelog"
source=("https://github.com/pgpointcloud/pointcloud/archive/v$pkgver.tar.gz")
sha256sums=('8542a4c714b4d0c67f10d092291a43b5650871b4ec8caf831e492810f25bb93c')

build() {
	cd "${pkgname#pg}-$pkgver"

	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "${pkgname#pg}-$pkgver"

	make check
}

package() {
	cd "${pkgname#pg}-$pkgver"

	install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	make DESTDIR="$pkgdir/" install
}
