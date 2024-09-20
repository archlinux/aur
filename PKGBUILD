# Maintainer: Rafael Just <rafaeljust@proton.me>
pkgname=lightly-fork-git 
pkgver=r2248.da15fb03
pkgrel=1
pkgdesc="Bali10050's fork of Lightly with a different approach from boehs, with the assumption that Luwx won't ever resume this project. Has plasma 6 support."
arch=('x86_64')
url="https://github.com/Bali10050/Lightly"
license=('GPL-2.0-only')
depends=('kdecoration' 'qt5-declarative' 'qt5-x11extras' 'kcoreaddons' 'kcmutils' 'kcolorscheme' 'kconfig' 'kguiaddons' 'kiconthemes' 'kwindowsystem' 'plasma-desktop')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=("lightly")
conflicts=("lightly" "lightly-kf6-git")
source=('git+https://github.com/Bali10050/Lightly.git')
sha256sums=('SKIP')

_pkgname="Lightly"

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF
  cd ./kdecoration/config/
  make -j 12
  cd ../../colors/
  make -j 12
  cd ../
  make -j 12
}

package() {
	cd "$srcdir/${_pkgname}"
	make DESTDIR="$pkgdir/" install
}
