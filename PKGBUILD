# Maintainer: envolution
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Maciej Mazur <mamciek@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=alttab
pkgver=1.7.1
pkgrel=3
pkgdesc="The task switcher for minimalistic window managers or standalone X11 session"
url="https://github.com/sagb/${pkgname}"
license=('GPL-3.0-only')
arch=('x86_64' 'i686' 'aarch64')
depends=('glibc' 'libx11' 'libxmu' 'libxft' 'libxrender' 'libxrandr' 'libpng' 'uthash' 'libxpm')
makedepends=('autoconf' 'automake' 'git')
# we need a recent commit to avoid several build failures
source=(
  "git+${url}.git#commit=739d9a7d4286fc06be1c75be8525404f6ec9d04a"
 )
sha256sums=('f14b5b32612609e9693f76282c82f8ff4464b8ee399185677c94d34421160dd6')

prepare() {
  cd $pkgname
  ./bootstrap.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
}
# vim:set ts=2 sw=2 et:
