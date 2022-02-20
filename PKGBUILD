# Maintainer: Javier Sánchez Parra <javsanpar@riseup.net>
pkgname=storytel-tui-git
_pkgname=storytel-tui
pkgver=r19.624bd42
pkgrel=1
pkgdesc='Storytel client for the terminal written in Rust'
url='https://github.com/javsanpar/storytel-tui'
source=("git+https://github.com/javsanpar/storytel-tui")
arch=('x86_64')
license=('GPL3')
makedepends=('cargo' 'mpv')
depends=('git')
provides=('storytel-tui')
sha256sums=(SKIP)

build () {
  cd "$srcdir/$_pkgname"

  cargo build --locked --release --target-dir target
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 target/release/storytel-tui "${pkgdir}/usr/bin/storytel-tui"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
