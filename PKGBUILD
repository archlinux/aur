# Maintainer: MCB-SMART-BOY <2720838051@qq.com>
pkgname=mcbtodo
pkgver=0.1.0
pkgrel=1
pkgdesc='Local-first task and workflow manager with a terminal interface'
arch=('x86_64' 'aarch64')
url='https://github.com/MCB-SMART-BOY/mcbtodo'
license=('Apache-2.0')
makedepends=('cargo')
source=("$pkgname-$pkgver-source.tar.gz::$url/releases/download/v$pkgver/mcbtodo-$pkgver-source.tar.gz")
sha256sums=('fb15e9fae29a69b8b6852bb2c05926e718ac01195833ee65be52e8e2fc2ef037')

build() {
  cd "$srcdir/mcbtodo-$pkgver"
  cargo build --locked --release --workspace \
    --bin mcbtodo \
    --bin mcbtodo-daemon \
    --bin mcbtodo-worker
}

package() {
  cd "$srcdir/mcbtodo-$pkgver"

  install -Dm755 target/release/mcbtodo "$pkgdir/usr/bin/mcbtodo"
  install -Dm755 target/release/mcbtodo-daemon "$pkgdir/usr/bin/mcbtodo-daemon"
  install -Dm755 target/release/mcbtodo-worker "$pkgdir/usr/bin/mcbtodo-worker"
  install -Dm644 apps/mcbtodo-daemon/assets/mcbtodo-daemon.service \
    "$pkgdir/usr/lib/systemd/user/mcbtodo-daemon.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
