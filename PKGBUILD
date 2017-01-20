# Maintainer: Leela Ross <leela@leela-ross.com>
pkgname=znc-push-git
pkgver=v1.0.0.r116.g717a2b1 
pkgrel=1
pkgdesc="ZNC Push is a module for ZNC that will send notifications to multiple push notification services"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://noswap.com/projects/znc-push"
license=('MIT')
depends=('znc')
source=("git+https://github.com/jreese/znc-push.git")
sha256sums=('SKIP')

pkgver() {
  cd znc-push
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd znc-push
  znc-buildmod push.cpp
}

package() {
  cd znc-push
  install -Dm755 push.so "$pkgdir/usr/lib/znc/push.so"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

