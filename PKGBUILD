# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
_pkgname=synthpod
pkgname="${_pkgname}-git"
pkgver=0.1.5537
pkgrel=4
pkgdesc="Lightweight non-linear plugin host"
arch=('i686' 'x86_64')
url="http://open-music-kontrollers.ch/lv2/synthpod/"
license=('Artistic2.0')
groups=('lv2-plugins' 'lv2-hosts')
depends=('lilv' 'jack' 'libgl')
makedepends=('git' 'cmake' 'lv2')
optdepends=('gtk2' 'gtk3' 'qt4' 'qt5-base')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
source=("$_pkgname::git+https://git.open-music-kontrollers.ch/lv2/synthpod")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  cat VERSION
}

build() {
  cd "$srcdir/$_pkgname"

  rm -rf build
  mkdir build
  cd build

  #
  # BUILD HERE
  #
  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
		-DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_JACK=1 \
    -DBUILD_ALSA=1 \
    -DBUILD_DUMMY=1 \
    -DBUILD_UI=1 \
    -DBUILD_SANDBOX_X11=1 \
    -DBUILD_SANDBOX_SHOW=1 \
    -DBUILD_SANDBOX_KX=1 \
    -DUSE_DYNAMIC_PARALLELIZER=1 \
		..
  make
}

package() {
  cd "$srcdir/$_pkgname/build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
