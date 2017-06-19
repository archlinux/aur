# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: David McInnis <davidm@eagles.ewu.edu>
# Contributor: HabarNam <habarnam@gmail.com>

pkgname=orion
pkgver=1.5.1rc
_dversion=1.5.1-rc
pkgrel=3
pkgdesc="QML/C++-written desktop client for Twitch.tv"
arch=('x86_64' 'i686')
url="https://github.com/alamminsalo/orion/"
license=('GPL')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'gst-libav')
provides=("${pkgname}")
conflicts=("$pkgname-git")
source=("https://github.com/alamminsalo/orion/archive/${_dversion}.tar.gz")
sha256sums=('8c4e311b6667ca76b121655bf6f9891adc70b9344d3d1bce7adf1664adadc30f')

build() {
	cd "$srcdir/${pkgname}-${_dversion}"
	qmake CONFIG+=multimedia
	make
}

package() {
    cd "$srcdir/${pkgname}-${_dversion}"
    
    sed -e "s|Icon=/usr/local/share/icons/orion.svg|Icon=orion|" -i distfiles/Orion.desktop

    install -Dm644 distfiles/orion.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/orion.svg
    install -Dm644 distfiles/Orion.desktop ${pkgdir}/usr/share/applications/Orion.desktop
    install -Dm755 orion ${pkgdir}/usr/bin/orion
}
