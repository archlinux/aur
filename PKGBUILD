# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

_pkgname=lvtk
pkgname="${_pkgname}-git"
pkgver=2.0.0.r484.6bfe981
pkgrel=1
pkgdesc="A set of C++ wrappers around the LV2 C API"
arch=('i686' 'x86_64')
url="https://github.com/lvtk/lvtk"
license=('GPL3')
depends=('boost-libs' 'lv2')
makedepends=('git' 'gtkmm' 'python2' 'ttl2c')
optdepends=('gtkmm: lv2 sample plugins')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/lvtk/lvtk.git")
md5sums=('SKIP')
changelog=ChangeLog


pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=`grep "^LVTK_VERSION" wscript | cut -d "'" -f 2`
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  export LDFLAGS="-lboost_system"
  export CXXFLAGS="-std=c++11 $CXXFLAGS"
  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd "${srcdir}/${_pkgname}"

  python2 waf install --destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:
