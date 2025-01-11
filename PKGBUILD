# Maintainer: Viech <viech unvanquished net>

pkgname=unvanquished-data
pkgver=0.55.2
pkgrel=1
pkgdesc='Game assets for Unvanquished'
arch=(any)
url='https://www.unvanquished.net'
license=(CC-BY-SA-2.5)
makedepends=(aria2)
source=("https://cdn.unvanquished.net/unvanquished_${pkgver}.torrent")
sha256sums=('d539833406184fd79025f08be98dbb8dbb9b7f34b26b393055cc874e8bf02ec0')

# Disable package compression since assets are already compressed.
PKGEXT='.pkg.tar'

prepare() {
	# Download the assets via torrent.
	aria2c -V --async-dns=false --seed-time=0 "unvanquished_${pkgver}.torrent"
}

check() {
	cd "unvanquished_${pkgver}/pkg"
	md5sum -c md5sums
}

package() {
	install -d -m 755 "${pkgdir}/usr/share/unvanquished/pkg/"
	install    -m 644 "${srcdir}/unvanquished_${pkgver}/pkg/"*".dpk" \
	                  "${pkgdir}/usr/share/unvanquished/pkg/"
}
