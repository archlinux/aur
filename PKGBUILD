# Maintainer: Gur0v
pkgname=zeptofetch
pkgver=1.13
pkgrel=1
pkgdesc="Blazingly fast, ultra-minimal system information tool for Linux"
arch=('x86_64')
url="https://gitlab.archlinux.org/gurov/zeptofetch"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.archlinux.org/gurov/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('a624606a90f821e28c85954d744898d27f21be40eab3dd5983952bfd13bfa1e5')

build() {
  cd "$pkgname-v$pkgver"
  export TZ=UTC
  make CFLAGS="-std=c99 -D_POSIX_C_SOURCE=200809L -D_DEFAULT_SOURCE -D_FORTIFY_SOURCE=2 -fstack-protector-strong -fno-strict-overflow -fno-strict-aliasing -fno-delete-null-pointer-checks -Wall -Wextra -Wpedantic -Werror=format=2 -Werror=implicit-fallthrough -Werror=shift-overflow=2 -Werror=cast-function-type -Werror=stringop-overflow=4 -Werror=vla -Werror=pointer-arith -march=native -O3 -flto -pipe" \
       LDFLAGS="-Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack -Wl,--gc-sections -Wl,--hash-style=gnu"
}

package() {
  cd "$pkgname-v$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
