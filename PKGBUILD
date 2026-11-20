# Maintainer: LIghtJUNction
# SPDX-License-Identifier: 0BSD
pkgname=project-bees
pkgver=0.1.0
pkgrel=1
pkgdesc='Deduplicate identical Btrfs file ranges across local Git repositories'
arch=('x86_64')
url='https://github.com/LIghtJUNction/project-bees'
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'sqlite')
optdepends=('systemd: run the background user service')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5d36e91d0886e76078653333ba5503dfdd0524ce4c1beccd8b89df57ed7f5a3d')

build() {
  cd "$pkgname-$pkgver"
  make BEES_VERSION="$pkgver" project-bees
}

package() {
  cd "$pkgname-$pkgver"
  make BEES_VERSION="$pkgver" PREFIX=/usr DESTDIR="$pkgdir" install-project-bees
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
