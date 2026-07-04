# Maintainer: John Mylchreest <jmylchreest@gmail.com>
pkgname=clipferry-git
pkgver=r1
pkgrel=1
pkgdesc="Lazy X11 <-> Wayland clipboard bridge for xwayland-satellite setups (git)"
arch=(x86_64 aarch64)
url="https://github.com/jmylchreest/clipferry"
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo git)
provides=(clipferry)
conflicts=(clipferry)
source=("clipferry::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd clipferry
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=8 HEAD)"
}

build() {
  cd clipferry
  cargo build --locked --release
}

check() {
  cd clipferry
  cargo test --locked --release
}

package() {
  cd clipferry
  install -Dm755 target/release/clipferry "$pkgdir/usr/bin/clipferry"
  install -Dm644 contrib/clipferry.service "$pkgdir/usr/lib/systemd/user/clipferry.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
