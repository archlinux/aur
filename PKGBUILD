# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Peter Mattern <pmattern at arcor dot de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname='libfilezilla'
pkgname="${_pkgname}-svn"
pkgver=0.24.1.r9959
pkgrel=1
pkgdesc='Small and modern C++ library, offering some basic functionality to build high-performing, platform-independent programs'
arch=('x86_64')
url="https://lib.filezilla-project.org"
license=("GPL2")
depends=('gnutls')
makedepends=('clang' 'subversion' 'doxygen')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::svn+https://svn.filezilla-project.org/svn/${_pkgname}/trunk")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  local revision="$(svnversion)"
  printf "%s.r%s" "$(grep -Pom1 '^[\d.]+' 'NEWS')" "${revision//[[:alpha:]]}"
}

build() {
  cd "${_pkgname}"
  export CXX=clang++
  export CC=clang
  autoreconf --install
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

package() {
  make DESTDIR="${pkgdir}" -C "${_pkgname}" install
}

# vim: ts=2 sw=2 et:
