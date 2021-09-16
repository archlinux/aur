# Maintainer: Ronan Pigott <rpigott@berkeley.edu>

pkgname=wlrctl
pkgver=0.2.1
pkgrel=2
pkgdesc='Utility for miscellaneous wlroots extensions'
url='https://git.sr.ht/~brocellous/wlrctl'
arch=('x86_64')
license=('MIT')
source=(
	"$pkgname-$pkgver.tar.gz::https://git.sr.ht/~brocellous/$pkgname/archive/v$pkgver.tar.gz"
)
depends=('wayland' 'libxkbcommon')
makedepends=('scdoc' 'meson' 'ninja')

md5sums=('bb91f35a71320ea908bb17acc2f41c27')

build() {
	cd "$pkgname-v$pkgver"
	meson \
		-Dwerror=false \
		--prefix /usr \
		"$srcdir/build"
	ninja -C "$srcdir/build"
}

package() {
	cd "$pkgname-v$pkgver"
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
