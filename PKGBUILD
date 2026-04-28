# Maintainer: InTeaReable <leyn.the.cat@gmail.com>

pkgname=nyado-git
pkgver=0.1.9.r0.gCOMMIT
pkgrel=1
pkgdesc="A Rust todo-list manager with TUI (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/LeynTheCat/nyado"
license=('MIT')
provides=("nyado")
conflicts=("nyado")
makedepends=('cargo' 'git')
source=("git+https://github.com/LeynTheCat/nyado.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/nyado"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/nyado"
  cargo build --release
}

package() {
  cd "$srcdir/nyado"
  install -Dm755 target/release/nyado "$pkgdir/usr/bin/nyado"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}