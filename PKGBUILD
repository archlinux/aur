# Maintainer: David McInnis <davidm@eagles.ewu.edu>
# Contributor: HabarNam <habarnam@gmail.com>

pkgname=orion
pkgver=1.3.0
pkgrel=1
pkgdesc="QML/C++-written desktop client for Twitch.tv"
arch=('x86_64' 'x86')
url="https://github.com/alamminsalo/orion/"
license=('GPL')
groups=()
depends=()
makedepends=('qmake' 'libcommuni' 'mpv' 'qt5-webengine' 'qt5-svg')
provides=("${pkgname}")
conflicts=("${pkgname%-git}")
source=("https://github.com/alamminsalo/orion/archive/v${pkgver}.tar.gz"
        "Orion.desktop"
)

sha256sums=('b7da580dc0c0c28978b5bf2a84a839a517503c98005616e1690c177867d0c148'
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
