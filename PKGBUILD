# Maintainer: Fijxu <fijxu at nadeko dot net>

pkgname=98fmplayer-git
_pkgname=98fmplayer
pkgver=v0.1.14.r11.g4fa914e
pkgrel=2
pkgdesc="PC-98 FM driver emulation"
arch=('i686' 'x86_64')
url="https://github.com/myon98/98fmplayer"
license=('BSD-2-Clause')
makedepends=('make' 'autoconf')
source=(
  "git+https://github.com/myon98/98fmplayer.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname/gtk"
  autoreconf -i
  ./configure
}

build() {
  cd "$srcdir/$_pkgname/gtk"
  make
}

package() {
  cd "$srcdir/$_pkgname/gtk"
  install -Dm755 98fmplayer "$pkgdir/usr/bin/98fmplayer"
}
