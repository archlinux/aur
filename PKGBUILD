# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: David McInnis <davidm@eagles.ewu.edu>
# Contributor: HabarNam <habarnam@gmail.com>

pkgname=orion
pkgver=1.6.5
pkgrel=2
pkgdesc="QML/C++-written desktop client for Twitch.tv"
arch=('x86_64')
url="https://github.com/alamminsalo/orion/"
license=('GPL')
depends=('mpv' 'qt5-svg' 'qt5-quickcontrols2' 'qt5-quickcontrols' 'qt5-graphicaleffects')
conflicts=("$pkgname-git")
source=("https://github.com/alamminsalo/orion/archive/${pkgver//_/\-}.tar.gz")
sha256sums=('6ec51b063b7025e7cc0aaf09e8a6f9943d0d0a44ba768d2bb2bbd0e6ee60f853')

build() {
	cd $srcdir/${pkgname}-${pkgver//_/\-}
	qmake CONFIG+=mpv
	make
}

package() {
    cd $srcdir/${pkgname}-${pkgver//_/\-}
    
    sed -e "s|Icon=/usr/local/share/icons/orion.svg|Icon=orion|" -i distfiles/Orion.desktop

    install -Dm644 distfiles/orion.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/orion.svg
    install -Dm644 distfiles/Orion.desktop ${pkgdir}/usr/share/applications/Orion.desktop
    install -Dm755 orion ${pkgdir}/usr/bin/orion
}
