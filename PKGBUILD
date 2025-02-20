# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=peroxide-ssh-manager-git
pkgver=0.2.0.r0.gb5a6c8d
pkgrel=1
pkgdesc="A terminal-based SSH connection manager written in Rust"
arch=('x86_64')
url="https://github.com/0xGingi/peroxide"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust' 'cargo')
provides=('peroxide-ssh-manager')
conflicts=('peroxide-ssh-manager')
source=("git+https://github.com/0xGingi/peroxide.git")
md5sums=('SKIP')
options=(!lto)

pkgver() {
  cd "$srcdir/peroxide"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/peroxide"
  cargo build --release
}

package() {
  cd "$srcdir/peroxide"
  install -Dm755 target/release/peroxide "$pkgdir/usr/bin/peroxide"
}
