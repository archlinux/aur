# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgname=amber_cmd
pkgver=0.1.20
pkgrel=1
pkgdesc="CLI for Amber framework that makes interfacing with your file system and applications much smoother."
arch=(i686 x86_64)
url='https://github.com/amber-crystal/amber-cmd'
license=(MIT)
depends=('sqlite' 'gc' 'libevent' 'libyaml' 'pcre')
makedepends=('crystal' 'shards')
source=("https://github.com/amber-crystal/amber-cmd/archive/v$pkgver.tar.gz")
sha256sums=('45ded959182ef17ac7a106bd653f6570a2d194f6d0900a1b16273c302caca33e')

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
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/amber-cmd/LICENSE
}
