# Maintainer: Viech <viech unvanquished net>

pkgname=unvanquished-data
pkgver=0.52.0
pkgrel=3
pkgdesc='Game assets for Unvanquished.'
arch=('any')
url='https://www.unvanquished.net'
license=('GPL3')
makedepends=('aria2')
source=("https://cdn.unvanquished.net/unvanquished_${pkgver}.torrent")
md5sums=('e87178fed12eb1222285fd57f64cf914')

# Disable package compression since assets are already compressed.
PKGEXT='.pkg.tar'

prepare() {
	cd "${srcdir}"

	# Download the assets via torrent.
	aria2c -V --seed-time=0 "unvanquished_${pkgver}.torrent"
}

check() {
	cd "${srcdir}/unvanquished_${pkgver}/pkg/"

	md5sum -c md5sums
}

package() {
	install -d -m 755 "${pkgdir}/usr/share/unvanquished/pkg/"
	install    -m 644 "${srcdir}/unvanquished_${pkgver}/pkg/"*".dpk" \
	                  "${pkgdir}/usr/share/unvanquished/pkg/"
}
