# Maintainer: Joe Davison <joe@warhaggis.com>

pkgname=znc-otr-git
pkgver=r57.ca696c9
pkgrel=1
pkgdesc="OTR (Off The Record) messaging for ZNC"
arch=('i686' 'x86_64')
url="http://wiki.znc.in/Otr"
license=('Apache')
depends=('znc' 'libotr')
source=("git+https://github.com/mmilata/znc-otr.git")
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/znc-otr
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd $srcdir/znc-otr
	make
}

package() {
	cd $srcdir/znc-otr

	install -D -m755 otr.so "$pkgdir/usr/lib/znc/otr.so"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

