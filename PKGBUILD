# Maintainer: Shawn Nock <shawn@monadnock.ca>
pkgname=littlefs-fuse
pkgver=2.0.0
pkgrel=1
license=("BSD")
pkgdesc="A FUSE wrapper that puts the littlefs in user-space"
depends=(
	"fuse2"
)
optdepends=(
)
arch=("x86_64")
url="https://github.com/ARMmbed/littlefs-fuse"
source=("https://github.com/ARMmbed/littlefs-fuse/archive/v${pkgver}.tar.gz")
sha256sums=("1440189d071246c4c77b0beb22f630e411d9e9b9b507623aa6e6dad6c02c2088")
provides=("littlefs-fuse")
conflicts=("littlefs-fuse")

build() {
	cd "${pkgname}-${pkgver}"
	LFLAGS="-Wl,-z,relro,-z,now" make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -d $pkgdir/usr/bin
	install -s lfs $pkgdir/usr/bin
	install -d $pkgdir/usr/share/licenses/littlefs-fuse
	install -m 664 LICENSE.md $pkgdir/usr/share/licenses/littlefs-fuse
}
