# Maintainer: Hans Binderup <hbinderup94@gmail.com>

pkgname=aliasx
pkgver=0.1.5
pkgrel=1
pkgdesc='Alias extended - task, alias and build handles'
url='https://github.com/hansbinderup/aliasx'
license=('Apache-2.0')
makedepends=('cargo')
depends=('glibc')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("https://github.com/hansbinderup/aliasx/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('575072a9f8cb4c2e0829ad04a04430f9a9a8dea710da8b95bc839710b1b374f7')

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
