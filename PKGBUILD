# Maintainer: maximumadmin <mxmadm@protonmail.com>

pkgname=zramd
pkgver=0.8.7
pkgrel=2
pkgdesc="Automatically setup swap on zram ✨"
arch=('any')
url="https://github.com/maximumadmin/zramd"
license=('MIT')
depends=('util-linux')
makedepends=('go')
optdepends=('earlyoom: userspace oom daemon')
conflicts=('systemd-swap' 'zramswap' 'zram-generator' 'zram-generator-git')
backup=('etc/default/zramd')
source=("https://github.com/maximumadmin/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ba60bb4af7d58b072ee903111d6e607975f023dfb53816bb585df34ab3b9c841')

build() {
  cd "$pkgname-$pkgver"
  local commit_date="${COMMIT_DATE:-$(date --iso-8601=seconds)}"
  VERSION="$pkgver" COMMIT_DATE="$commit_date" make
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  PREFIX="$pkgdir" make install
}
