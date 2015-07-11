# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=fabla-git
_pkgname=fabla
pkgver=1.3.1.r3.gcfbd4b3
pkgrel=1
pkgdesc="A sampler LV2 plugin"
arch=('i686' 'x86_64')
url="http://openavproductions.com/fabla/"
license=('GPL')
groups=('lv2-plugins')
depends=('lv2' 'cairomm' 'libsndfile' 'ntk-git')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/harryhaaren/openAV-Fabla.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --long | sed -r 's/^release.//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p build
  cd build
  cmake "-DCMAKE_INSTALL_PREFIX=${pkgdir}/usr" ..
  make PREFIX="/usr"
}

package() {
  cd "${srcdir}/${_pkgname}/build"

  make install
}
