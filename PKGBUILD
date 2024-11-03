# Maintainer: Viech <viech unvanquished net>

pkgname=unvanquished-data
pkgver=0.55.1
pkgrel=1
pkgdesc='Game assets for Unvanquished'
arch=(any)
url='https://www.unvanquished.net'
license=(CC-BY-SA-2.5)
makedepends=(aria2)
source=("https://cdn.unvanquished.net/unvanquished_${pkgver}.torrent")
sha256sums=('922fc38985787d97ac37c54f08af2a0f7141aa1b2af36473b309d7728af1b3ef')

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
