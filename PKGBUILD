# Maintainer: Stephen Brennan <smb196@case.edu>
pkgname=communi-desktop
pkgver=3.5.0
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
md5sums=("5fd5d87a9f4ecdce86a7004915b3f094"
         "1f23bf566b7f676e041c9bfaa458e014")
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
