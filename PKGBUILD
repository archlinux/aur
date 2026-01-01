# Maintainer: Hans Binderup <hbinderup94@gmail.com>

pkgname=aliasx
pkgver=0.1.6
pkgrel=1
pkgdesc='Alias extended - task, alias and build handles'
url='https://github.com/hansbinderup/aliasx'
license=('Apache-2.0')
makedepends=('cargo')
depends=('glibc')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("https://github.com/hansbinderup/aliasx/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b2934384ffb576f9b50acda40b72c66ec3c15b924edcf85df802de162b1c56d8')

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    pushd "$srcdir/aliasx-$pkgver" > /dev/null
    cargo build --locked --release
    popd > /dev/null
}

package() {
    pushd "$srcdir/aliasx-$pkgver" > /dev/null
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    popd > /dev/null
}
