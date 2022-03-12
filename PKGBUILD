# Maintainer: skrewball <skrewball at joickle dot com>

pkgname=treasure-chest-bin
pkgver=5.4.2
pkgrel=1
pkgdesc='Full Node Wallet For Pirate Chain (ARRR)'
arch=('x86_64')
url='https://github.com/PirateNetwork/pirate'
license=('GPL2')
provides=('pirate-qt')
depends=('gcc-libs' 'libxcb' 'fontconfig' 'expat' 'harfbuzz' 'pcre')
optdepends=('libappindicator-gtk3: system tray support'
	'libnotify: desktop notification support')
source=("https://github.com/PirateNetwork/pirate/releases/download/v${pkgver}/pirate-qt-ubuntu1804-v${pkgver}.deb"
	"treasure.chest.desktop.patch")
sha256sums=('ba480a2fa45a0776814b10a8270fbd8bb25f9a098cf9dabd331a6d2fee9da2f4'
            '8d6398b81aa57d8ad6e80b038af6114512e13689f3667cd6be615cfd3d4be870')

prepare() {
    tar -xf data.tar.xz
    patch --directory="$srcdir" --strip=1 --input=treasure.chest.desktop.patch
}

package() {
    cd "$srcdir"
    install -Dm755 usr/local/bin/pirate-qt "${pkgdir}/usr/bin/pirate-qt"
    install -Dm644 usr/share/applications/pirate-qt.desktop "${pkgdir}/usr/share/applications/pirate-qt.desktop"
    install -Dm644 usr/share/pixmaps/pirate.xpm "${pkgdir}/usr/share/pixmaps/pirate.xpm"
}
