# Maintainer: VanillaGreen <ai1@vanillagreen.com>
pkgname=kendex-git
pkgver=r0.0000000
pkgrel=1
pkgdesc='Package manager for agents, skills, and hooks across AI coding tools (latest commit)'
arch=('x86_64' 'aarch64')
url='https://kendex.ai'
license=('MIT')
provides=('kendex')
conflicts=('kendex')
makedepends=('rust' 'cargo' 'git')
source=('git+https://github.com/vanillagreencom/kendex.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kendex"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/kendex"
  cargo build --release --locked --bin kendex
}

package() {
  cd "$srcdir/kendex"
  install -Dm755 target/release/kendex "$pkgdir/usr/bin/kendex"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
