# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
_pkgname=synthpod
pkgname="${_pkgname}-git"
pkgver=689
pkgrel=1
pkgdesc="Lightweight non-linear plugin host"
arch=('i686' 'x86_64')
url="http://open-music-kontrollers.ch/lv2/synthpod"
license=('Artistic2.0')
groups=('lv2-plugins' 'lv2-hosts')
depends=('lilv' 'jack' 'zita-alsa-pcmi' 'elementary' 'hicolor-icon-theme' 'nanomsg' 'sratom' 'libxcb' 'gtk2' 'gtk3' 'qt4' 'qt5-base')
makedepends=('git' 'cmake' 'lv2' 'xdg-utils')
optdepends=('moony-lv2' 'sherlock-lv2')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=synthpod.install
source=("$_pkgname::git+https://github.com/OpenMusicKontrollers/synthpod.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git log --pretty=oneline | wc -l
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
    -DBUILD_SANDBOX_LIB=1 \
    -DBUILD_SANDBOX_X11=1 \
    -DBUILD_SANDBOX_GTK2=1 \
    -DBUILD_SANDBOX_GTK3=1 \
    -DBUILD_SANDBOX_QT4=1 \
    -DBUILD_SANDBOX_QT5=1 \
    -DBUILD_SANDBOX_EFL=0 \
    -DBUILD_SANDBOX_SHOW=0 \
    -DBUILD_SANDBOX_KX=0 \
		..
  make
}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
