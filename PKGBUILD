# Maintainer: David McInnis <davidm@eagles.ewu.edu>
# Contributor: HabarNam <habarnam@gmail.com>

pkgname=orion
pkgver=1.3.5
pkgrel=1
pkgdesc="QML/C++-written desktop client for Twitch.tv"
arch=('x86_64' 'i686')
url="https://github.com/alamminsalo/orion/"
license=('GPL')
groups=()
depends=('mpv' 'qt5-webengine' 'qt5-svg' 'qt5-quickcontrols')
makedepends=('qt5-declarative' 'libcommuni')
optdepends=('qtav: alternate video output'
            'qt5-multimedia: alternate video output')
provides=("${pkgname}")
conflicts=("${pkgname%-git}")
source=("https://github.com/alamminsalo/orion/archive/v${pkgver}.tar.gz"
        "Orion.desktop"
)

sha256sums=('0094b3202a7cfe0bc5139fd30e0cd371fce76abad3eb019d355dce67b715c8c6'
            '8bb70253fa24734bc612e602cb347f629bc59f3c0d83b1c7b59e0cbafdd91ea3')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	qmake 
	make
}

package() {
    mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/bin"

    cd "$srcdir/${pkgname}-${pkgver}"
	cp "distfiles/orion.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/" 
	cp "../Orion.desktop" "$pkgdir/usr/share/applications/"
	cp "orion" "$pkgdir/usr/bin/" 
}
