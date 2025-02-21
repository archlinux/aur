# Maintainer: HidemaruOwO <owner@v-sli.me>

pkgname=interception-ctrl-arrow-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Interception plugin: Ctrl + hjkl for arrow keys.'
arch=('x86_64')
license=('MIT')
url='https://git.v-sli.me/HidemaruOwO/interception-ctrl-hjkl'
depends=('interception-tools' 'gcc-libs' 'glibc')
makedepends=('git' 'cargo')
source=($pkgname::git+https://git.v-sli.me/HidemaruOwO/interception-ctrl-hjkl.git udevmon-interception-ctrl-aroow-git.hook)
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags --exclude nightly | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/ctrl-hjkl-arrow"
    install -Dm644 ctrl-hjkl-arrow.yaml "${pkgdir}/etc/interception/udevmon.d/ctrl-hjkl-arrow.yaml"

    install -Dm644 "$srcdir/udevmon-interception-ctrl-aroow-git.hook" "$pkgdir/usr/share/libalpm/hooks/udevmon-interception-ctrl-aroow-git.hook"
}
