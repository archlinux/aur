# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgname=amber_cmd
pkgver=0.1.17
pkgrel=1
pkgdesc="CLI for Amber framework that makes interfacing with your file system and applications much smoother."
arch=(i686 x86_64)
url='https://github.com/Amber-Crystal/amber_cmd'
license=(MIT)
depends=('crystal' 'readline' 'shards')
makedepends=('llvm')
source=("https://github.com/Amber-Crystal/amber_cmd/archive/v$pkgver.tar.gz")
sha256sums=('721d8d9dbd13df2187e7d6ffad5b00894908dd18dbc90d65c85272422f84f4a5')

build() {
  cd "$pkgname-$pkgver"
  make build
  crystal eval 'STDIN.blocking = true'
}

check() {
  cd "$pkgname-$pkgver"
  crystal spec --no-debug -p
  crystal eval 'STDIN.blocking = true'
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/amber "$pkgdir/usr/bin/amber"
}
