# Maintainer: Eric Siebeneich <devzeebo>
pkgname=bifrost-go
pkgver=1.1.1
pkgrel=1
pkgdesc="A beads-like agent task list framework (Go implementation)"
arch=('x86_64' 'aarch64')
url="https://github.com/devzeebo/bifrost"
license=('MIT')
depends=('glibc')
makedepends=('go' 'make' 'nodejs' 'npm')

provides=("bf" "bifrost-server")
conflicts=("bf" "bifrost-server" "bifrost-go-git")

backup=('etc/bifrost/server.yaml')

source=("bifrost-$pkgver.tar.gz::https://github.com/devzeebo/bifrost/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "bifrost-$pkgver"
  make build
}

check() {
  cd "bifrost-$pkgver"
  make test
}

package() {
  cd "bifrost-$pkgver"

  install -Dm755 bin/bf "$pkgdir/usr/bin/bf"
  install -Dm755 bin/bifrost-server "$pkgdir/usr/bin/bifrost-server"

  install -Dm644 pkg/arch/bifrost.service "$pkgdir/usr/lib/systemd/system/bifrost.service"
  install -Dm644 pkg/arch/server.yaml "$pkgdir/etc/bifrost/server.yaml"
  install -Dm644 pkg/arch/bifrost.sysusers "$pkgdir/usr/lib/sysusers.d/bifrost.conf"
  install -Dm644 pkg/arch/bifrost.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/bifrost.conf"

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
