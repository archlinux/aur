# Maintainer: Akhil J <akhil.j@outlook.in>

pkgname=ondir-git
pkgver=r13.55279f0
pkgrel=1
pkgdesc="a small program to automate tasks specific to certain directories"
arch=('i686' 'x86_64')
url="https://github.com/alecthomas/ondir.git"
license=('GPL2')
makedepends=('git')
depends=('glibc')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::git://github.com/alecthomas/ondir.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  sed -i '/USE_ONENTERLEAVE/c#define USE_ONENTERLEAVE' conf.h
}

build() {
  cd "$pkgname"
  make CFLAGS="$CFLAGS "'-DVERSION=\"$(VERSION)\" -DGLOBAL_CONF=\"$(CONF)\"' LDFLAGS="$LDFLAGS"
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
