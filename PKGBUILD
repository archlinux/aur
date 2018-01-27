# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
_pkgname=moony.lv2
pkgname=moony-lv2
pkgver=0.22.0
pkgrel=2
pkgdesc="Realtime Lua as programmable glue in LV2"
arch=('i686' 'x86_64')
url='http://open-music-kontrollers.ch/lv2/moony/'
license=('Artistic2.0')
groups=('lv2-plugins')
depends=('libgl')
makedepends=('cmake' 'lv2')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://git.open-music-kontrollers.ch/lv2/$_pkgname/snapshot/$_pkgname-$pkgver.tar.xz")
noextract=()
sha256sums=('d1e513c7e2684ba83445fd438967312c67ab6cc1a414e79cddceffe53741f1d8')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  rm -rf build
	mkdir build
}

build() {
  cd "$srcdir/$_pkgname-$pkgver/build"

  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
		-DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_TESTING=1 \
		..
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/build"

  make DESTDIR="$pkgdir/" install
}

check() {
  cd "$srcdir/$_pkgname-$pkgver/build"

  ARGS='-VV' make test
}

# vim:set ts=2 sw=2 et:
