# Maintainer: Hans Binderup <hbinderup94@gmail.com>

pkgname=aliasx
pkgver=0.1.7
pkgrel=1
pkgdesc='Alias extended - task, alias and build handles'
url='https://github.com/hansbinderup/aliasx'
license=('Apache-2.0')
makedepends=('cargo')
depends=('glibc')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("https://github.com/hansbinderup/aliasx/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f808a18d0e049cb30cc1e8662f8270f6fd46d08f65848edd5a6e4e59221d114f')

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
