# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=gitnr
pkgver=0.2.2
pkgrel=1
makedepends=('rust' 'cargo' 'wget')
depends=('glibc' 'gcc-libs' 'openssl')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A CLI to generate .gitignore files using one or more templates"
url="https://github.com/reemus-dev/gitnr"
license=('MIT')

prepare() {
    cd "$srcdir"
    mkdir -p "usr/share/licenses/$pkgname"
    wget https://raw.githubusercontent.com/reemus-dev/gitnr/refs/heads/main/LICENSE --directory-prefix "usr/share/licenses/$pkgname"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir"
    cargo install --root="$srcdir" --git="$url" --no-track --all-features
}

package() {
    install -Dm 755 "$srcdir/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -D "$srcdir/usr/share/licenses/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
