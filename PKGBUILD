# Maintainer: Luca Weiss <luca@z3ntu.xyz>
# Contributor: user20159 <https://aur.archlinux.org/account/user20159>
pkgname=matrix-sliding-sync
_basename=sliding-sync
pkgver=0.99.12
pkgrel=1
pkgdesc="Sliding sync proxy for matrix protocol, required for modern clients like Element X."
arch=('x86_64')
url="https://github.com/matrix-org/sliding-sync"
license=('Apache')
makedepends=('go>=1.19')
source=("${_basename}-${pkgver}.tar.gz::https://github.com/matrix-org/${_basename}/archive/v${pkgver}.tar.gz"
        "matrix-sliding-sync.service"
        "matrix-sliding-sync.conf")
sha256sums=('de8f0f360e6e366ae1623a7b06e1691c92f08af92c0a4563450182a19ffa0002'
            '0185da8695331343e42bd41c07b9bf20906c8dda14d29de8386bad1fbc6bcafa'
            'f8b74879166b1fc857fcc66155bd7bfe74da717160b8e72971f90506669d822d')
backup=("etc/matrix-sliding-sync.conf")

build() {
  cd "$srcdir/${_basename}-$pkgver"
  go build ./cmd/syncv3/
}

package() {
  install -Dm755 "$srcdir/${_basename}-$pkgver/syncv3" "$pkgdir"/usr/bin/syncv3
  install -Dm600 matrix-sliding-sync.service "$pkgdir"/usr/lib/systemd/system/matrix-sliding-sync.service
  install -Dm600 matrix-sliding-sync.conf "$pkgdir"/etc/matrix-sliding-sync.conf
}
