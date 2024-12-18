# Maintainer: caier <base64: a29zbW96aWVtaWFAZ21haWwuY29tCg==>
# Contributor: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>

_pkgname=kactus2
pkgname="$_pkgname-git"
pkgver=3.13.3.r4.g16813a2
pkgrel=1

pkgdesc='Open source IP-XACT-based tool for ASIC, FPGA and embedded systems design'
arch=(any)
url='https://research.tuni.fi/system-on-chip/tools/'
license=('GPLv2')

depends=(qt6-base qt6-tools qt6-svg libgl 'swig>=3.0.12' 'python>=3.8')
makedepends=(git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

backup=('etc/xdg/TUT/Kactus2.ini')

source=(
	'git+https://github.com/kactus2/kactus2dev.git'
)
b2sums=(
	'SKIP'
)

pkgver() {
	cd "$srcdir/kactus2dev"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/kactus2dev"
	./configure --prefix=/usr
	make 
}

package() {
	cd "$srcdir/kactus2dev"
	make INSTALL_ROOT=${pkgdir} install
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
