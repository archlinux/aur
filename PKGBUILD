# Maintainer: let <let@notlet.dev>

pkgname=overmask
pkgver=0.1.4.r55.g36bc082
pkgrel=1
pkgdesc='Add a writeable overlay on top of read-only files'
arch=('any')
url='https://github.com/ErrorNoInternet/overmask'
license=('LGPL3')
makedepends=('rust')
source=('git+https://github.com/ErrorNoInternet/overmask')
sha256sums=('SKIP')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd overmask

    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    install -Dm755 overmask/target/release/overmask "${pkgdir}/usr/bin/overmask"
}

pkgver() {
  cd "$srcdir/overmask"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}