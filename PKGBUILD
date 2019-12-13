# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=peasy
pkgname="${_pkgname}-git"
pkgver=0.9.r146.b3d43ff
pkgrel=2
pkgdesc="A plugin for Geany  which allows to load other plugins written in Python or Lua (Git version)"
url="https://github.com/kugel-/peasy/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('libpeas' 'geany')
makedepends=('vala')
optdepends=('python: support plugins written in Python'
            'lua51: support plugins written in Lua')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/kugel-/peasy.git")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  ver=$(git describe --tags | sed -e 's/^v//' -e 's/-/_/g')
  echo $ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh
  sed -i -e 's/@install_sh@/install/g' po/Makefile.in.in
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
