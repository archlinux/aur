# Maintainer: Ancker-0 <andy87654@outlook.com>
pkgname=i2pchat-git
pkgver=r649.ge070834
pkgrel=1
epoch=
pkgdesc="Secure, anonymous p2p chat client for the I2P network"
arch=('x86_64')
url="https://vituperative.github.io/i2pchat/"
license=('GPL')
groups=()
depends=('qt5-multimedia' 'hicolor-icon-theme')
makedepends=('git' 'qt5-base' 'make')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/vituperative/i2pchat.git')
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
    printf 'r%s.g%s' "$(git -C i2pchat rev-list --count HEAD)" "$(git -C i2pchat rev-parse --short HEAD)"
}

build() {
	cd i2pchat
	qmake I2PChat.pro "CONFIG += release"
	make
}

package() {
	cd i2pchat
	install -D -m755 I2PChat -t ${pkgdir}/usr/bin/
	install -D -m755 I2PChat ${pkgdir}/usr/bin/i2p-messenger
	install -D -m644 debian/i2p-messenger.1 -t "${pkgdir}/usr/share/man/man1"
	install -D -m644 debian/i2p-messenger.desktop -t "${pkgdir}/usr/share/applications"
	install -D -m644 debian/i2p-messenger.xpm -t "${pkgdir}/usr/share/icons/hicolor/32x32/apps"
}
