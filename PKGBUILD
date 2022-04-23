# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>

pkgname=znc-q-git
pkgver=r2.320779f
pkgrel=1
pkgdesc="ZNC module for authenticating with QuakeNets Q bot"
arch=('any')
url="https://github.com/jkhsjdhjs/znc-q"
license=('Apache')
makedepends=('git' 'cmake')
depends=('znc')
source=("${pkgname%-git}::git+https://github.com/jkhsjdhjs/znc-q"
        'znc-q.hook')
sha512sums=('SKIP'
            '7e04b60b096867b80979b2b82949d0f2df3e4c4af3ecb56667b89fee17640a7baabb7e505a7451344f55af13df962a7f7b612b5406a02a3d346357ae0e09cda4')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  znc-buildmod q.cpp
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm644 q.so "$pkgdir/usr/lib/znc/q.so"
  install -Dm644 ../znc-q.hook "$pkgdir/usr/share/libalpm/hooks/znc-q.hook"
}
