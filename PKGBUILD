# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgname=amber_cmd
pkgver=0.1.21
pkgrel=1
pkgdesc="CLI for Amber framework that makes interfacing with your file system and applications much smoother."
arch=(i686 x86_64)
url='https://github.com/amber-crystal/amber-cmd'
license=(MIT)
depends=('sqlite' 'gc' 'libevent' 'libyaml' 'pcre')
makedepends=('crystal' 'shards')
source=("https://github.com/amber-crystal/amber-cmd/archive/v$pkgver.tar.gz")
sha256sums=('8fc7bdd55421c74b715e188014eb1bd37dc9975365d9f4c115087a600213b8b6')

build() {
  cd "amber-cmd-$pkgver"
  shards
  mkdir -p bin
  make build
  crystal eval 'STDIN.blocking = true'
}

check() {
  cd "amber-cmd-$pkgver"
  crystal spec --no-debug -p
  crystal eval 'STDIN.blocking = true'
}

package() {
  cd "amber-cmd-$pkgver"
  install -Dm755 bin/amber "$pkgdir/usr/bin/amber"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/amber_cmd/LICENSE
}
