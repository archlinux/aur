# Maintainer: Hans Binderup <hbinderup94@gmail.com>

pkgname=aliasx
pkgver=0.2.1
pkgrel=2
pkgdesc='Alias extended - task, alias and build handles'
url='https://github.com/hansbinderup/aliasx'
license=('Apache-2.0')
makedepends=('cargo')
depends=('glibc')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("https://github.com/hansbinderup/aliasx/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('407635efb3f07602460d1220e00835340f0f84a5f1688657dad5cc85c523e570')

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    pushd "$srcdir/aliasx-$pkgver" > /dev/null
    cargo build --locked --release
    popd > /dev/null
}

package() {
    pushd "$srcdir/aliasx-$pkgver" > /dev/null
    install -Dm0755 "target/release/aliasx-cli" "$pkgdir/usr/bin/aliasx"
    popd > /dev/null
}
