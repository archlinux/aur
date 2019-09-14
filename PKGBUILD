# Maintainer: Benjamin Maisonnas <ben at wainei dot net>
# Author: Elio VP <elio at eliovp dot be>
# Author: A. Solodovnikov

_pkgbase=amdmemorytweak
pkgname=amdmemorytweak-git
pkgver=38.43d122f
pkgrel=1
pkgdesc="Read and modify memory timings on AMD graphics cards"
arch=('x86_64' 'i686')
url="https://github.com/Eliovp/amdmemorytweak"
license=('GPL')
depends=('pciutils')
makedepends=('git' 'gcc')
provides=('amdmemorytweak')

source=("$_pkgbase::git+$url.git")

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgbase"
  g++ linux/AmdMemTweak.cpp $CPPFLAGS $CXXFLAGS $LDFLAGS -lpci -lresolv -o $_pkgbase
}

package() {
  cd "$srcdir/$_pkgbase"
  install -d -m755 $pkgdir/usr/bin
  install -m755 $_pkgbase $pkgdir/usr/bin/$_pkgbase
}
