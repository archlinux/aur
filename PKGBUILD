# Maintainer: Sean Anderson <seanga2@gmail.com>
_vcsname=alterpcb-tlinesim
pkgname=$_vcsname-git
pkgver=r59.d4724c8
pkgrel=2
pkgdesc="transmission line simulation tool"
arch=(x86_64)
url="https://www.maartenbaert.be/alterpcb/tlinesim/"
license=(GPL3)
depends=(
	qt5-base
)
makedepends=(
	git
	eigen
	suitesparse
)
checkdepends=()
optdepends=()
provides=(alterpcb-tlinesim)
conflicts=(alterpcb-tlinesim)
source=(
	"git+https://github.com/MaartenBaert/${_vcsname}.git#branch=master"
)
sha256sums=('SKIP')

pkgver() {
	cd $_vcsname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	gendesk -f -n --pkgname $_vcsname --pkgdesc "$pkgdesc" \
		--name "AlterPCB Transmission Line Simulator"  \
		--categories "Development;Electronics"

	cd $_vcsname/src
	qmake PREFIX="/usr"
	make
}

package() {
	install -Dt "$pkgdir/usr/share/applications/" -m644 "$_vcsname.desktop"

	cd $_vcsname/src
	make INSTALL_ROOT="$pkgdir" install
}
