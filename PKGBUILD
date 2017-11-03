# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=chrpath-svn
pkgver=r175
pkgrel=1
pkgdesc="Tool to adjust the RPATH or RUNPATH of ELF binaries"
arch=('i686' 'x86_64')
url="https://chrpath.alioth.debian.org/"
license=('GPL')
depends=('glibc')
makedepends=('subversion')
provides=('chrpath')
conflicts=('chrpath')
source=("svn://scm.alioth.debian.org/svn/chrpath/trunk")
sha256sums=('SKIP')


pkgver() {
  cd "trunk"

  _ver="$(svnversion)"
  printf "r%s" "${_ver//[[:alpha:]]}"
}

build() {
  cd "trunk"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

package() {
  cd "trunk"

  make DESTDIR="$pkgdir" docdir="/usr/share/doc/chrpath" install
}
