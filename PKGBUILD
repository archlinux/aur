# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
_pkgname=moony.lv2
pkgname=moony-lv2
pkgver=0.20.0
pkgrel=1
pkgdesc="Realtime Lua as programmable glue in LV2"
arch=('i686' 'x86_64')
url='http://open-music-kontrollers.ch/lv2/moony'
license=('Artistic2.0')
groups=('lv2-plugins')
depends=('libxext' 'libgl' 'cairo')
makedepends=('cmake' 'lv2' 'libxslt')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/OpenMusicKontrollers/$_pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=('bb9bc5e91ca3160c4ddfc382fc72622c')

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
