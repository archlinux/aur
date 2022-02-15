# Maintainer: monkeyballs <mydick@cunny.com>

pkgname="sataniabuddy-git"
_pkgname="sataniabuddy"
pkgver=r68.ade3a6f
pkgrel=1
pkgdesc="Virtual Satania Desktop Assistant"
arch=("x86_64" "i686")
url="https://git.cianig.ga/monkeyballs/sataniabuddy"
license=('AGPL')
depends=("openmotif" "cairo" "xorg-server")
makedepends=("git" "make" "gcc")
provides=("sataniabuddy" "satania-buddy")
conflicts=("sataniabuddy" "satania-buddy")
options=()
source=(git+https://git.cianig.ga/monkeyballs/sataniabuddy)
md5sums=('SKIP')
prepare() {
	cd "$srcdir"/"$_pkgname"
	sed -i "s/AssetDirectory = \"\/usr\/local\/share\/satania\/assets\"/AssetDirectory = \"\/usr\/share\/satania\/assets\"/" main.c
}
build() {
	cd "$srcdir"/"$_pkgname"
	make
}
pkgver() {
	cd "$srcdir"/"$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$srcdir"/"$_pkgname"
	make PREFIX="$pkgdir/usr" install
}
