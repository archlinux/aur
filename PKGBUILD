# Maintainer: Stephen Brennan <smb196@case.edu>
pkgname=communi-desktop
pkgver=3.4.0
pkgrel=1
epoch=
pkgdesc="An IRC client for desktop environments."
arch=('x86_64' 'i686')
url="https://communi.github.io/"
license=('GPL')
groups=()
depends=('qt5-x11extras' 'qt5-multimedia' 'hicolor-icon-theme' 'xdg-utils' 'libcommuni')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=.INSTALL
changelog=
source=("communi-desktop-v$pkgver.tar.gz::https://github.com/communi/$pkgname/archive/v$pkgver.tar.gz"
        "communi-shared-v$pkgver.tar.gz::https://github.com/communi/communi-shared/archive/v$pkgver.tar.gz")
noextract=()
md5sums=("8f05ceb73232a763b4821e53fd6d7317"
         "420d3167ddce7a338d803ecc2fa5d03a")
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
}
