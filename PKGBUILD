# Maintainer: Kian Kasad (kdkasad@gmail.com)
pkgname=chirp-daily-latest
pkgver=20200622
pkgrel=2
pkgdesc="Latest build of Chirp - a GUI tool for programming ham radios"
arch=('any')
url="https://chirp.danplanet.com/"
license=('GPL3')
depends=('python2-lxml' 'python2-pyserial' 'pygtk')
optdepends=('hamradio-menus')
options=(!emptydirs)
conflicts=(chirp)
provides=(chirp)
sha256sums=(
	'SKIP'
	'68dbeb5e23e277fb164111ca9a6a04ee3715c07c94b43c1d648222b2b25211fa'
)
source=(
	"https://trac.chirp.danplanet.com/chirp_daily/daily-${pkgver}/chirp-daily-${pkgver}.tar.gz"
	'chirp-xdgconfig.diff'
)

pkgver() {
	curl -s https://trac.chirp.danplanet.com/chirp_daily/LATEST/ | grep -o 'chirp-daily-202[0-9]\{5\}\.tar\.gz' | sed 's/chirp-daily-//; s/\.tar\.gz//; 1q'
}

prepare() {
	cd "chirp-daily-${pkgver}"
	patch -p1 -i ../chirp-xdgconfig.diff
}

package() {
	cd "${pkgname%-latest}-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
}
