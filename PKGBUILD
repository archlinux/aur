# Maintainer: Marc ROGER de CAMPAGNOLLE <fora at mrdc dot fr>

pkgname=deadbeef-plugin-hdcd-git
_pkgname=deadbeef-hdcd
pkgver=r8.15f468a
pkgrel=1
pkgdesc="An HDCD decoder DSP plugin for deadbeef audio player, using libhdcd"
arch=('i686' 'x86_64')
url="https://github.com/bp0/deadbeef-hdcd"
license=('BSD')
depends=('deadbeef' 'libhdcd')
makedepends=('git' 'gcc')
source=("git+https://github.com/bp0/deadbeef-hdcd.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname/"
  sh build.sh
}

package() {
  mkdir -p "$pkgdir/usr/lib/deadbeef"
  cd "$srcdir/$_pkgname/"
  mv ddb_hdcd.so "$pkgdir/usr/lib/deadbeef/"
}
