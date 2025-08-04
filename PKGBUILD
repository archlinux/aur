# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=t9plusledcontrol
pkgver=r15.4a9259a
pkgrel=1
pkgdesc="LED controler for T9 plus mini PC"
arch=(x86_64)
url="https://github.com/cwt/LED.git"
license=(MIT)
depends=(glibc)
makedepends=(
  git
  gcc
)
options=(!debug)
source=($pkgname::git+$url)
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  export CFLAGS="$CFLAGS -fcf-protection=full"
  export CXXFLAGS="$CXXFLAGS -fcf-protection=full"
  export LDFLAGS="$LDFLAGS -Wl,-z,relro -Wl,-z,now -Wall"
  gcc $CFLAGS $LDFLAGS -o "$pkgname" LED.c
}

package() {
  cd $pkgname
  install -vDm755 $pkgname -t "$pkgdir"/usr/bin/
  install -vDm644 LICENSE  -t "$pkgdir"/usr/share/licenses/$pkgname/
}
