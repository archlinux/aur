# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: David McInnis <davidm@eagles.ewu.edu>
# Contributor: HabarNam <habarnam@gmail.com>

pkgname=orion
pkgver=1.5.1rc
_dversion=1.5.1-rc
pkgrel=2
pkgdesc="QML/C++-written desktop client for Twitch.tv"
arch=('x86_64' 'i686')
url="https://github.com/alamminsalo/orion/"
license=('GPL')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'hicolor-icon-theme' 'gst-libav')
provides=("${pkgname}")
conflicts=("${pkgname%-git}")
source=("https://github.com/alamminsalo/orion/archive/${_dversion}.tar.gz"
        "Orion.desktop"
)

sha256sums=('8c4e311b6667ca76b121655bf6f9891adc70b9344d3d1bce7adf1664adadc30f'
            '8bb70253fa24734bc612e602cb347f629bc59f3c0d83b1c7b59e0cbafdd91ea3')

build() {
	cd "$srcdir/${pkgname}-${_dversion}"
	qmake CONFIG+=multimedia
	make
}

package() {
    mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/bin"

    cd "$srcdir/${pkgname}-${_dversion}"
	cp "distfiles/orion.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/" 
	cp "../Orion.desktop" "$pkgdir/usr/share/applications/"
	cp "orion" "$pkgdir/usr/bin/" 
}
