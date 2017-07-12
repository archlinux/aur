# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: David McInnis <davidm@eagles.ewu.edu>
# Contributor: HabarNam <habarnam@gmail.com>

pkgname=orion
pkgver=1.6.1
pkgrel=2
pkgdesc="QML/C++-written desktop client for Twitch.tv"
arch=('x86_64' 'i686')
url="https://github.com/alamminsalo/orion/"
license=('GPL')
depends=('mpv' 'qt5-svg' 'qt5-quickcontrols2')
provides=("${pkgname}")
conflicts=("$pkgname-git")
source=("https://github.com/alamminsalo/orion/archive/v${pkgver//_/\-}.tar.gz")
sha256sums=('eaa8ace822d3381a1915db82c4203d4ce4e56ec324d4ee18544bd68b00bce749')

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
