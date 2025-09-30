pkgname=stasis-git
pkgver=0.1.46.r1.gc843162   # auto-generated
pkgrel=1
pkgdesc="A modern Wayland idle manager designed for simplicity and effectiveness (git version)"
arch=('x86_64')
url="https://github.com/saltnpepper97/stasis"
license=('MIT')
depends=('rust' 'systemd')
makedepends=('git' 'cargo')
provides=('stasis')
conflicts=('stasis')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/stasis"
  git describe --long --tags --always | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/stasis"
  cargo build --release --locked
}

package() {
  cd "$srcdir/stasis"
  install -Dm755 "target/release/stasis" "$pkgdir/usr/bin/stasis"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
