# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: David McInnis <davidm@eagles.ewu.edu>
# Contributor: HabarNam <habarnam@gmail.com>

pkgname=orion
pkgver=1.6.0_beta
pkgrel=1
pkgdesc="QML/C++-written desktop client for Twitch.tv"
arch=('x86_64' 'i686')
url="https://github.com/alamminsalo/orion/"
license=('GPL')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-quickcontrols2' 'gst-libav')
provides=("${pkgname}")
conflicts=("$pkgname-git")
source=("https://github.com/alamminsalo/orion/archive/v${pkgver//_/\-}.tar.gz")
sha256sums=('d7ad6670285ca75c53fe899215f0f847e0cda86b7b32a55cdaa3470a750fa77f')

build() {
	cd $srcdir/${pkgname}-${pkgver//_/\-}
	qmake CONFIG+=multimedia
	make
}

package() {
    cd $srcdir/${pkgname}-${pkgver//_/\-}
    
    sed -e "s|Icon=/usr/local/share/icons/orion.svg|Icon=orion|" -i distfiles/Orion.desktop

    install -Dm644 distfiles/orion.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/orion.svg
    install -Dm644 distfiles/Orion.desktop ${pkgdir}/usr/share/applications/Orion.desktop
    install -Dm755 orion ${pkgdir}/usr/bin/orion
}
