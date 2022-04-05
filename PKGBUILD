# Maintainer: Romain Chardiny <romain.chardiny@gmail.com>
_basename=injures
pkgname=${_basename}-git
pkgver=r1.b090b4d
pkgrel=1
pkgdesc="Bad words"
arch=("x86_64")
url="https://github.com/romch007/injures.git"
license=('MIT')
groups=()
depends=()
makedepends=('xmake' 'git')
provides=("${_basename}")
conflicts=("${_basename}")
source=('git+https://github.com/romch007/injures.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_basename"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_basename"
  xmake config --mode=release -y -v
  xmake -v $MAKEFLAGS
}

package() {
  cd "$srcdir/$_basename"
  DESTDIR="$pkgdir/usr" xmake install --root
}
