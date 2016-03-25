# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=rkr-lv2
pkgname="${_pkgname}-git"
pkgver=beta_1.r10.ge0a080b
pkgrel=1
pkgdesc="rakarrack effects ported to LV2 plugins (git version)"
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/ssj71/rkrlv2'
depends=('fftw' 'libsamplerate' 'lv2')
makedepends=('git' 'cmake')
source=("${_pkgname}::git+https://github.com/ssj71/rkrlv2")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # Use the tag of the last commit
  git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  if [[ -d build ]]; then
    rm -rf build
  fi

  mkdir build
}

build() {
  cd "${srcdir}/${_pkgname}/build"

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
