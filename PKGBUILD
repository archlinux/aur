# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=eelu-login-git
pkgver=v0.2.0.r19.gcd8556b
pkgrel=1
epoch=
pkgdesc="A command-line tool that allows staff and students to log in to the Egyptian E-Learning University Moodle platform quickly and easily through the command-line interface."
makedepends=('rust' 'cargo' 'git')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/anas-elgarhy/eelu-login"
license=('MIT OR Apache-2.0')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
install=
changelog=
source=("$pkgname::git+$url#branch=master")
noextract=()

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
sha256sums=('SKIP')
