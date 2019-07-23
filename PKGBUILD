# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=shinjiru-git
_pkgname=Shinjiru
pkgver=3.4.0.r1.g993574e
pkgrel=1
pkgdesc="Shinjiru is an anime list management tool built with Qt designed to automatically update your progress to AniList and act an desktop manager for AniList."
arch=('i686' 'x86_64')
url="https://github.com/ShinjiruApp/Shinjiru"
license=('GPL')
groups=()
depends=('hicolor-icon-theme' 'libxinerama' 'qt5-networkauth' 'qt5-base' 'qt5-webkit' 'qt5-webengine' 'gcc-libs-multilib')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('shinjiru::git+https://github.com/ShinjiruApp/Shinjiru')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule update --init
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake PREFIX=/usr #QMAKE_INSTALL_FILE="install -Dm 655 -p"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install

  install -Dm644 res/icon_48.png "$pkgdir/usr/share/icons/hicolor/48x48/${_pkgname}.png"
  install -Dm644 res/icon_256.png "$pkgdir/usr/share/icons/hicolor/256x256/${_pkgname}.png"
  install -Dm644 res/icon.png "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
}
