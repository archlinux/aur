# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=t9plusledcontrol-git
pkgver=r15.4a9259a
pkgrel=1
pkgdesc="LED controler for T9 plus mini PC"
arch=(x86_64)
url="https://github.com/cwt/LED"
license=(MIT)
depends=(glibc)
makedepends=(
  git
  gcc
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug)
source=(${pkgname%-git}::git+$url)
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-git}
  export CFLAGS+=" -fcf-protection=full"
  export LDFLAGS+=" -Wl,-z,relro -Wl,-z,now -Wall"
  gcc $CFLAGS $LDFLAGS -o "${pkgname%-git}" LED.c
}

package() {
  cd ${pkgname%-git}
  install -vDm755 ${pkgname%-git} -t "$pkgdir"/usr/bin/
  install -vDm644 LICENSE         -t "$pkgdir"/usr/share/licenses/$pkgname/
}
