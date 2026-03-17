# Maintainer: a821 at mail de

pkgname=libpathrs
pkgver=0.2.4
pkgrel=1
pkgdesc="C-friendly API to make path resolution safer on Linux"
arch=(x86_64)
url="https://github.com/cyphar/libpathrs"
license=('MPL-2.0 OR LGPL-3.0-or-later')
depends=(glibc libgcc)
makedepends=(cargo)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('45aca68e698b844fae0cf7c459bc441519b0e7b48397caa7d3936cfc68d73f77')
options=(!lto)

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    unset MAKEFLAGS
    make release
}

package() {
    cd "$pkgname-$pkgver"
    ./install.sh DESTDIR="$pkgdir" --prefix=/usr --lib=/usr/lib
}
