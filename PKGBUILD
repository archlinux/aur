# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Nick Lanham <nick@afternight.org>

pkgname=amsynth-git
_pkgname=amsynth
pkgver=1.8.0.r1026.c75ff5f
pkgrel=1
pkgdesc="An analog modelling (a.k.a. virtual analog) synthesizer"
arch=('i686' 'x86_64')
url="https://amsynth.github.io/"
license=('GPL2')
depends=('gtk2' 'jack' 'lv2')
makedepends=('git')
optdepends=('liblo: DSSI plugin')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/amsynth/amsynth.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ver=$(git describe --tags `git rev-list --tags --max-count=1` | cut -f 2 -d -)
  echo $ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
