# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=phantom-editor-git
pkgver=2.0.0.r1.g4da608d
pkgrel=1
pkgdesc="Phantom is a lightweight terminal-based text editor written in Rust"
arch=('x86_64')
url="https://github.com/0xGingi/phantom"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust' 'cargo')
provides=('phantom-editor')
conflicts=('phantom-editor' 'phantom-editor-bin')
source=("git+https://github.com/0xGingi/phantom.git")
md5sums=('SKIP')
options=(!lto)

pkgver() {
  cd "$srcdir/phantom"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/phantom"
  cargo build --release
}

package() {
  cd "$srcdir/phantom"
  install -Dm755 target/release/phantom "$pkgdir/usr/bin/phantom"
}
