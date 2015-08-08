# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Nick Lanham <nick@afternight.org>

pkgname=amsynth-git
_pkgname=amsynth
pkgver=1.5.1.r729.d394e83
pkgrel=2
pkgdesc="An analog modelling (a.k.a. virtual analog) synthesizer"
arch=('i686' 'x86_64')
url="https://code.google.com/p/amsynth/"
license=('GPL2')
depends=('gtkmm' 'jack' 'lv2' 'desktop-file-utils')
makedepends=('git')
optdepends=('liblo: DSSI plugin')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://code.google.com/p/amsynth/")
install="amsynth.install"
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
