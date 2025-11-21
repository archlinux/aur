# Maintainer: Hans Binderup <hbinderup94@gmail.com>

pkgname=aliasx
pkgver=0.1.4
pkgrel=1
pkgdesc='Alias extended - task, alias and build handles'
url='https://github.com/hansbinderup/aliasx'
license=('Apache-2.0')
makedepends=('cargo')
depends=('glibc')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("https://github.com/hansbinderup/aliasx/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('11f2c3238a5bee75970d1d40c79382f3c49cacf56724a861abda1176681facba')

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
