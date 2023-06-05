# Maintainer: Akarsh Jain <akarsh.1995.02@gmail.com>

pkgname=interception-caps2esc-arrow-git
pkgver=r19.2623069
pkgrel=1
pkgdesc='Interception plugin: Capslock tap for escape key, Capslock + hjkl for arrow keys.'
arch=('x86_64')
license=('MIT')
url='https://github.com/akarsh1995/interception-caps2esc-hjkl-arrow'
depends=('interception-tools')
makedepends=('git' 'cargo')
source=($pkgname::git+https://github.com/akarsh1995/interception-caps2esc-hjkl-arrow)
md5sums=('SKIP')
install='post.install'

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/caps2esc-hjkl-arrow"
    install -Dm644 caps2esc-hjkl-arrow.yaml "${pkgdir}/etc/interception/udevmon.d/caps2esc-hjkl-arrow.yaml"
}

