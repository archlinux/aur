# Maintainer: florex <bburakozdemir01@gmail.com>
pkgname=archdoctor-git
pkgver=0.1.2
pkgrel=1
pkgdesc="Minimalist terminal system diagnostics tool for Arch Linux (TUI)"
arch=('x86_64')
url="https://github.com/florexdev/archdoctor"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('archdoctor')
conflicts=('archdoctor')
source=("git+https://github.com/florexdev/archdoctor.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || echo "0.1.2"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  cargo build --release --locked
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 "target/release/archdoctor" "$pkgdir/usr/bin/archdoctor"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/archdoctor/README.md"
}
