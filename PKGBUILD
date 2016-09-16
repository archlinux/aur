# Maintainer: David McInnis <davidm@eagles.ewu.edu>
# Contributor: HabarNam <habarnam@gmail.com>

pkgname=orion
pkgver=1.3.1
pkgrel=1
pkgdesc="QML/C++-written desktop client for Twitch.tv"
arch=('x86_64' 'i686')
url="https://github.com/alamminsalo/orion/"
license=('GPL')
groups=()
depends=('mpv' 'qt5-webengine' 'qt5-svg')
makedepends=('qtchooser' 'libcommuni')
provides=("${pkgname}")
conflicts=("${pkgname%-git}")
source=("https://github.com/alamminsalo/orion/archive/v${pkgver}.tar.gz"
        "Orion.desktop"
)

sha256sums=('d51976e066dc942b20a2596cb68a8cf60206cb61836586bb56dbd7c05368c1c5'
            'a0bb773176dd7ec448ecd5702da9c32b35da27ea3070b23496fe51abb15d8d44')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	qmake 
	make
}

package() {
    mkdir -p "$pkgdir/usr/share/icons"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/bin"

    cd "$srcdir/${pkgname}-${pkgver}"
	cp "orion.svg" "$pkgdir/usr/share/icons/" 
	cp "../Orion.desktop" "$pkgdir/usr/share/applications/"
	cp "orion" "$pkgdir/usr/bin/" 
}
