# Maintainer: maximumadmin <mxmadm at protonmail dot com>

pkgname=zramd
pkgver=0.8.9
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
sha256sums=('2b91f02ae4e957d0cc49af8a31a1592a47fd310ce6779b8cad31cf85dadb594a')

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
