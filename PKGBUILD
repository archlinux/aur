# Maintainer: Stephen Brennan <smb196@case.edu>
# Contributor: Arvedui <arvedui@posteo.de>
pkgname=communi-desktop
pkgver=3.6.0
pkgrel=1
pkgdesc="An IRC client for desktop environments."
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://communi.github.io/"
license=('BSD')
depends=('qt5-x11extras' 'qt5-multimedia' 'hicolor-icon-theme' 'xdg-utils' 'libcommuni')
makedepends=('chrpath')
install=.INSTALL
source=("communi-desktop-v$pkgver.tar.gz::https://github.com/communi/$pkgname/archive/v$pkgver.tar.gz"
        "communi-shared-v$pkgver.tar.gz::https://github.com/communi/communi-shared/archive/v$pkgver.tar.gz")
noextract=()
md5sums=("97764bc84a7c80c7d7f6724b6106fb03"
         "379ca7959c9b8e1d4a004b29e1ad768f")
validpgpkeys=()

prepare() {
    cd "$pkgname-$pkgver"
    rmdir src/libs/base/shared
    mv "../communi-shared-$pkgver" src/libs/base/shared
}

build() {
	cd "$pkgname-$pkgver"
        qmake
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install

	chrpath -d "${pkgdir}/usr/bin/communi"
}
