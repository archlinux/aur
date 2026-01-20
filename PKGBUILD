# Maintainer: getjump <getjump0@gmail.com>

pkgname=nirinit-git
pkgver=0.1.4.r2.g9b6db3e
pkgrel=1
pkgdesc="A session manager for Niri"
arch=('x86_64')
url="https://github.com/amaanq/nirinit"
license=('MPL-2.0')
depends=('gcc-libs')
makedepends=('cargo' 'git')
optdepends=('niri: Wayland compositor required at runtime')
provides=('nirinit')
conflicts=('nirinit')
source=("nirinit::git+https://github.com/amaanq/nirinit.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/nirinit"
  git describe --tags --long | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd "$srcdir/nirinit"
  cargo build --release --locked
}

package() {
  cd "$srcdir/nirinit"

  install -Dm755 target/release/nirinit "$pkgdir/usr/bin/nirinit"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
