# Maintainer: Valentin Rouet <v.rouet@gmail.com>

_pkgname=drmr
pkgname="${_pkgname}-git"
pkgver=r90.ba6994a
pkgrel=1
pkgdesc="DrMr is an LV2 sampler plugin that can play Hydrogen drumkits."
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/nicklan/drmr"
groups=('lv2-plugins')
depends=('libsndfile' 'libsamplerate' 'expat' 'lv2' 'gtk2')
makedepends=('git')
provides=('drmr' "${_pkgname}")
conflicts=('drmr' "${_pkgname}")
source=("${_pkgname}::git+https://github.com/nicklan/drmr.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  revision=$(git rev-list --count HEAD)
  hash=$(git rev-parse --short HEAD)
  echo r$revision.$hash
}

build() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="$pkgdir/" install
}
