# Maintainer: LIghtJUNction
# SPDX-License-Identifier: 0BSD
pkgname=project-bees
pkgver=0.1.1
pkgrel=1
pkgdesc='Deduplicate identical Btrfs file ranges across local Git repositories'
arch=('x86_64')
url='https://github.com/LIghtJUNction/project-bees'
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'sqlite')
optdepends=('systemd: run the background user service')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('536d017465f486cd6888ae6aa7f3c8fba935b35da1f9a4c80ca999f4eb27d7f4')

build() {
  cd "$pkgname-$pkgver"
  make BEES_VERSION="$pkgver" project-bees
}

package() {
  cd "$pkgname-$pkgver"
  make BEES_VERSION="$pkgver" PREFIX=/usr DESTDIR="$pkgdir" install-project-bees
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
