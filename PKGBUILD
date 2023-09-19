# Maintainer: Baudouin Feildel <baudouin_aur@feildel.fr>
pkgname=pgpointcloud
pkgver=1.2.5
pkgrel=1
pkgdesc="A PostgreSQL extension for storing point cloud (LIDAR) data"
arch=('i686' 'x86_64')
url="https://github.com/pgpointcloud/pointcloud"
license=('custom: pgpointcloud')
depends=('libxml2')
optdepends=()
makedepends=('cunit' 'clang15' 'llvm15')
provides=("pgpointcloud=$pkgver")
conflicts=('pgpointcloud-git')
changelog="$pkgname.changelog"
source=(
	"https://github.com/pgpointcloud/pointcloud/archive/v$pkgver.tar.gz"
)
sha256sums=(
	'f3924f283345f2da46a971e65f0c6ce602640ecf88a2057293443ec2a7a56774'
)

prepare() {
	cd "${pkgname#pg}-$pkgver"
}

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
