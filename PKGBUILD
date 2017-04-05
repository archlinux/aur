# Maintainer: David McInnis <davidm@eagles.ewu.edu>
# Contributor: HabarNam <habarnam@gmail.com>

pkgname=orion
pkgver=1.4.0
pkgrel=1
pkgdesc="QML/C++-written desktop client for Twitch.tv"
arch=('x86_64' 'i686')
url="https://github.com/alamminsalo/orion/"
license=('GPL')
groups=()
depends=('qt5-multimedia' 'qt5-webengine' 'qt5-svg' 'qt5-quickcontrols' 'qt5-quickcontrols2')
provides=("${pkgname}")
conflicts=("${pkgname%-git}")
source=("https://github.com/alamminsalo/orion/archive/${pkgver}.tar.gz"
        "Orion.desktop"
)

sha256sums=('4adb8ff6a3c24aed14a31d9c17474ee88df52b3cde5d5d1b48b41b4f7a0ae4a0'
            '8bb70253fa24734bc612e602cb347f629bc59f3c0d83b1c7b59e0cbafdd91ea3')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	qmake CONFIG+=multimedia
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
