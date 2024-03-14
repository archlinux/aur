# Maintainer: Bruno Miguel <bruno@privacyrequired.com>
pkgname=kdotool-git
pkgver=0.2.1.febba49
pkgrel=1
pkgdesc='xdotool-like for KDE Wayland'
arch=(x86_64)
url='https://github.com/jinliu/kdotool'
license=(Apache-2.0)
depends=(plasma-wayland-protocols)
makedepends=(git rust cargo)
provides=(kdotool)
source=(git+$url.git)
sha256sums=('SKIP')
md5sums=('SKIP')

pkgver() {
    cd "$provides"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)//;s/-/./g'
}

prepare() {
    cd "$provides"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$provides"
    cargo build --all-features --release
}

check() {
    cd "$provides"
    cargo test --frozen --all-features
}

package() {
    install -Dm755 "$srcdir/$provides/target/release/kdotool" "$pkgdir/usr/bin/kdotool"
    install -Dm755 "$srcdir/$provides/LICENSE" "$pkgdir/usr/share/licenses/$provides/LICENSE"
}


