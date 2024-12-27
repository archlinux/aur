# Maintainer: Duologic <jeroen@simplsitic.be>

pkgname=jrsonnet-git
pkgver=v0.5.0.pre96.test.r66.g6baa18d
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/CertainLach/jrsonnet"
license=('MIT')
depends=()
makedepends=('cargo')
source=("git+https://github.com/CertainLach/jrsonnet.git#branch=master")
sha512sums=('SKIP')

provides=(jrsonnet)
conflicts=(jrsonnet)

pkgver() {
  cd "$srcdir/jrsonnet"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/jrsonnet"

  cargo build --release --locked
}

check() {
  cd "$srcdir/jrsonnet"

  cargo test --release --locked
}

package() {
  cd "$srcdir/jrsonnet"

  install -Dm755 "target/release/jrsonnet" "$pkgdir/usr/bin/jrsonnet"
}
