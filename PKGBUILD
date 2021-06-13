# Maintainer: maximumadmin <mxmadm at protonmail dot com>

pkgname=zramd
pkgver=0.9.1
pkgrel=1
pkgdesc="Automatically setup swap on zram ✨"
arch=('any')
url="https://github.com/maximumadmin/zramd"
license=('MIT')
depends=('util-linux')
makedepends=('go')
optdepends=('earlyoom: userspace oom daemon')
conflicts=('systemd-swap'
           'zramswap'
           'zram-generator'
           'zram-generator-git')
backup=('etc/default/zramd')
source=("https://github.com/maximumadmin/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ded468408536ce80e87ab4e31f7fecaec98f0d618ead53f0feb4bc83a239cd59')

build() {
  cd "$pkgname-$pkgver"
  local commit_date="${COMMIT_DATE:-$(date --iso-8601=seconds)}"
  GOPATH="${srcdir}/go" VERSION="$pkgver" COMMIT_DATE="$commit_date" make
}

check() {
  cd "$pkgname-$pkgver"
  GOPATH="${srcdir}/go" make test
}

package() {
  cd "$pkgname-$pkgver"
  PREFIX="$pkgdir" make install
}
