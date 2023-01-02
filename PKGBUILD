# Maintainer: aulonsal <seraur at aulonsal dot com>
# Contributor: Akhil J <akhil.j@outlook.in>

pkgname=ondir-git
_pkgname="${pkgname%-git}"
pkgver=r13.55279f0
pkgrel=2
pkgdesc="Small program to automate tasks specific to certain directories"
arch=('i686' 'x86_64')
url="https://github.com/alecthomas/ondir"
license=('GPL2')
depends=('glibc')
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  sed -i '/USE_ONENTERLEAVE/c#define USE_ONENTERLEAVE' conf.h
}

build() {
  cd "$_pkgname"
  make CFLAGS="$CFLAGS "'-DVERSION=\"$(VERSION)\" -DGLOBAL_CONF=\"$(CONF)\"' LDFLAGS="$LDFLAGS"
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
