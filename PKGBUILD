pkgname=fireurl
pkgver=0.3.1
pkgrel=0
pkgdesc="Fixing the firejail URL open issue"
arch=('x86_64')
url="https://github.com/rusty-snake/fireurl"
license=('MIT')
depends=('firejail')
makedepends=('cargo')

source=("https://github.com/rusty-snake/fireurl/releases/download/v${pkgver}/fireurl-v${pkgver}.src.tar.xz")
sha256sums=('6cde3d86f2eb99b313f71f4fbc8264d8720291c607f51948755ba576a93f06e2')

build() {
  cd "$pkgname-v$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm0644 systemd/fireurld.service $pkgdir/usr/lib/systemd/user/fireurld.service
  install -Dm0755 target/release/fireurl $pkgdir/usr/bin/fireurl
  install -Dm0755 target/release/fireurld $pkgdir/usr/bin/fireurld
}
