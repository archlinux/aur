# Maintainer: Francesco Minnocci <ad17fmin@uwcad.it>

pkgname=himalaya-tui-git
pkgver=0.1.0.r71.g4c2af0f
pkgrel=1
pkgdesc="TUI to manage emails, from the Pimalaya project"
arch=('x86_64')
url="https://github.com/pimalaya/himalaya-tui"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=('himalaya-tui')
conflicts=('himalaya-tui')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
# ring does not link when the release profile's fat LTO is enabled.
options=('!lto')

pkgver() {
  cd "$pkgname"
  printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  cargo fetch --locked
}

build() {
  cd "$pkgname"
  cargo build --release --locked --offline
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/himalaya-tui "$pkgdir/usr/bin/himalaya-tui"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
# vim:set ts=2 sw=2 et:
