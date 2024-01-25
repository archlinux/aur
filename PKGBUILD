# Maintainer: Severin Leonhardt <serviushack at gmx dot de>
pkgname=hypernate
pkgver=1.2.0
pkgrel=1
pkgdesc='Get more out of hibernation'
url='https://gitlab.com/serviushack/hypernate'
license=('ISC')
makedepends=(cargo)
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("git+https://gitlab.com/serviushack/hypernate.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd $pkgname
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd $pkgname
  cargo build --frozen --release --all-features
}

package() {
  cd $pkgname
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
