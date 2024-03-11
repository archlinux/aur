# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=gleam-git
pkgver=1.0.0.r60.gf125b96c7
pkgrel=1
pkgdesc="A statically typed language for the Erlang VM"
arch=('x86_64')
license=('Apache-2.0')
url='https://github.com/gleam-lang/gleam'
makedepends=('git' 'cargo')
depends=('erlang-nox')
provides=('gleam')
conflicts=('gleam')
source=('gleam::git+https://github.com/gleam-lang/gleam.git')
sha256sums=('SKIP')
options=(strip !docs !libtool !staticlibs !lto)

pkgver() {
  cd "gleam"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "gleam"

  cargo build --release
}

check() {
  cd "gleam"

  cargo test
}

package() {
  cd "gleam"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/gleam

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE
}
