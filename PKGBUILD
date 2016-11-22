# Maintainer: Flat <flat@imo.uto.moe>
pkgname=shinjiru-git
pkgver=r711.bb3ee6e
pkgrel=1
pkgdesc="Shinjiru is an anime list management tool built with Qt designed to automatically update your progress to AniList and act an desktop manager for AniList."
arch=('i686' 'x86_64')
url="https://github.com/Kazakuri/Shinjiru"
license=('GPL')
groups=()
depends=('hicolor-icon-theme' 'qt5-base' 'qt5-webengine' 'gcc-libs-multilib')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('shinjiru::git+https://github.com/Kazakuri/Shinjiru.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule update --init
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake PREFIX=/usr QMAKE_INSTALL_FILE="install -Dm 655 -p"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install
}
