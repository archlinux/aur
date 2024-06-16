# Maintainer: Astro Orbis <astroorbis@gmail.com>
pkgname=i3ref
pkgver=0.1.0
pkgrel=1
makedepends=('rust' 'cargo' 'git')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Command-line i3wm reference"
url="https://github.com/astroorbis/i3ref"
license=('MIT')
source=("git+https://github.com/astroorbis/i3ref.git")
md5sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    echo $(pwd)
    cargo fetch --locked
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
