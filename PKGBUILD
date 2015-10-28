# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Nick Lanham <nick@afternight.org>

pkgname=amsynth-git
_pkgname=amsynth
pkgver=1.6.1.r786.66fb7a7
pkgrel=1
pkgdesc="An analog modelling (a.k.a. virtual analog) synthesizer"
arch=('i686' 'x86_64')
url="https://code.google.com/p/amsynth/"
license=('GPL2')
depends=('gtkmm' 'jack' 'lv2' 'desktop-file-utils')
makedepends=('git')
optdepends=('liblo: DSSI plugin')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/amsynth/amsynth.git")
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
  CXXFLAGS="-std=c++11 $CXXFLAGS" ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
