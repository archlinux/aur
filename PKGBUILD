# Maintainer: Jake McGinty <jake@tonari.no>

pkgname=innernet
pkgver=v1.0.0
pkgrel=1
pkgdesc="A tool to manage WireGuard network topologies."
#epoch=0
arch=('x86_64')
url="https://github.com/tonarino/innernet"
license=('MIT')
depends=('sqlite')
conflicts=("innernet-git")
makedepends=('git' 'cargo')
source=("$pkgname::git+https://github.com/tonarino/innernet#tag=$pkgver")
sha1sums=('SKIP')

build() {
  cd "$pkgname"

  cargo build --release --locked
}

check() {
  cd "$pkgname"

  cargo test --release --locked
}

package() {
  cd "$pkgname"

  install -Dm755 "target/release/innernet" "$pkgdir/usr/bin/innernet"
  install -Dm755 "target/release/innernet-server" "$pkgdir/usr/bin/innernet-server"
  ln -s innernet "$pkgdir/usr/bin/inn"

  install -Dm644 "client/innernet@.service" "$pkgdir/usr/lib/systemd/system/innernet@.service"
  install -Dm644 "server/innernet-server@.service" "$pkgdir/usr/lib/systemd/system/innernet-server@.service"

  install -Dm644 "doc/innernet.8.gz" "$pkgdir/usr/share/man/man8/innernet.8.gz"
  install -Dm644 "doc/innernet-server.8.gz" "$pkgdir/usr/share/man/man8/innernet-server.8.gz"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

