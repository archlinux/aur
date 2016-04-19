# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
_pkgname=moony.lv2
pkgname=moony-lv2
pkgver=0.2.3
pkgrel=1
pkgdesc="Realtime Lua as programmable glue in LV2"
arch=('i686' 'x86_64')
url='http://open-music-kontrollers.ch/lv2/moony'
license=('Artistic2.0')
groups=('lv2-plugins')
depends=('libuv' 'elementary' 'lilv' 'sratom' 'nanomsg')
makedepends=('cmake' 'lv2' 'flex')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/OpenMusicKontrollers/$_pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=('55d0a968c06b883049ed225085fb9f0b')

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
    -DBUILD_COMMON_UI=1 \
    -DBUILD_SIMPLE_UI=1 \
    -DBUILD_WEB_UI=1 \
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
