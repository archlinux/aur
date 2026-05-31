# Maintainer: Dan Zavadin <daniil.zavadin@gmail.com>
pkgname=dionysus-git
pkgver=c9e137e
pkgrel=1
pkgdesc="Simple GTK4 application launcher for Wayland"
arch=('x86_64')
url="https://github.com/dzavadindev/dionysus"
license=('GPL-3.0-or-later')
provides=('dionysus')
conflicts=('dionysus')

depends=('gtk4' 'gtk4-layer-shell' 'glib2')
makedepends=('cargo' 'rust' 'pkgconf' 'git' 'gtk4-layer-shell')
options=(!debug)

source=("git+https://github.com/dzavadindev/dionysus.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/dionysus"
  git rev-parse --short HEAD
}

build() {
  cd "$srcdir/dionysus"
  cargo build --release --locked
}

check() {
  cd "$srcdir/dionysus"
  cargo test --release --locked
}

package() {
  cd "$srcdir/dionysus"

  install -Dm755 target/release/dionysus "$pkgdir/usr/bin/dionysus"
}
