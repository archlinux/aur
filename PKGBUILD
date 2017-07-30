# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgname=amber_cmd
pkgver=0.1.19
pkgrel=1
pkgdesc="CLI for Amber framework that makes interfacing with your file system and applications much smoother."
arch=(i686 x86_64)
url='https://github.com/amber-crystal/amber-cmd'
license=(MIT)
depends=('sqlite' 'gc' 'libatomic_ops' 'libevent' 'llvm-libs' 'pcre')
makedepends=('crystal' 'shards' 'llvm')
source=("https://github.com/amber-crystal/amber-cmd/archive/v$pkgver.tar.gz")
sha256sums=('37110d180bccd4a78294e96cadde067b264d0b4bc14e977012b34d16a72e03d5')

build() {
  cd "$pkgname-$pkgver"
  shards
  mkdir -p bin
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
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/amber/LICENSE
}
