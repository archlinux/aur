# Maintainer: maximumadmin <mxmadm at protonmail dot com>

pkgname=zramd
pkgver=0.9.0
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
sha256sums=('fee8bd8882da499e00c1993e787c6e8e4f6958a1fac6b19c21a0147a52191501')

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
