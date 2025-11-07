<<<<<<< HEAD
=======
# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
<<<<<<< HEAD

# PKGBUILD forked from calf-git [https://aur.archlinux.org/packages/calf-git] by
>>>>>>> daddf36 (switch from autotools to cmake, thank you binarynoise for the patch)
# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
=======
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
>>>>>>> c3909e7 (switch from autotools to cmake, thank you binarynoise for the patch)
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

_pkgname=calf
pkgname="${_pkgname}-git"
pkgver=0.90.0.r2499.bc104350
pkgrel=2
pkgdesc="LV2/JACK audio plug-ins for musicians (git version)"
arch=('i686' 'x86_64')
url="http://calf-studio-gear.org/"
license=('GPL' 'LGPL')
depends=('fluidsynth' 'gtk2' 'lv2')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/calf-studio-gear/calf")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  version=$(awk -F '[][]' '/AC_INIT/{print $4}' configure.ac)
  revision=$(git rev-list --count HEAD)
  hash=$(git rev-parse --short HEAD)
  echo $version.r$revision.$hash
}

build() {
<<<<<<< HEAD
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh \
    --prefix="/usr" \
    --enable-static=no \
    --enable-sse \
    --without-lash
  make
=======
  local cmake_options=(
    -B build
    -GNinja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DWANT_EXPERIMENTAL=ON
    -DWANT_SSE=ON
<<<<<<< HEAD
    -DWANT_GUI=OFF
=======
>>>>>>> c3909e7 (switch from autotools to cmake, thank you binarynoise for the patch)
    -DWANT_LASH=OFF
    -S "$_pkgname"
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build
>>>>>>> daddf36 (switch from autotools to cmake, thank you binarynoise for the patch)
}

package(){
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir/" install
}
