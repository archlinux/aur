# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
# Contributor: Ray Rashif <rayrashif@gmail.com>

_pkgname=swh-lv2
pkgname="${_pkgname}-git"
pkgver=1.0.16.r51.1aa77e5
pkgrel=1
pkgdesc="Experimental port of Steve Harris' LADSPA plugins to LV2 format"
arch=('i686' 'x86_64')
url="http://plugin.org.uk/"
license=("GPL3")
groups=('lv2-plugins')
depends=('fftw' 'lv2')
makedepends=('git' 'libxslt')
provides=("${_pkgname}" "${_pkgname//-/.}")
conflicts=("${_pkgname}" "${_pkgname//-/.}")
source=("${_pkgname}::git+https://github.com/swh/lv2.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  ver=$(grep ^VERSION Makefile | sed 's/VERSION = //')
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make INSTALL_DIR="${pkgdir}/usr/lib/lv2" install-system
}

# vim:set ts=2 sw=2 et:
