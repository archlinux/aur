# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=logria
pkgver=0.1.3alpha
pkgrel=2
url="https://github.com/ReagentX/Logria"
makedepends=('rust' 'cargo' 'wget')
depends=('glibc' 'gcc-libs')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A powerful CLI tool that puts log analytics at your fingertips."
license=('GPL-3.0-only')

prepare() {
    cd "$srcdir"
    mkdir -p usr/share/licenses/$pkgname
    wget https://raw.githubusercontent.com/ReagentX/Logria/refs/heads/develop/LICENSE --directory-prefix usr/share/licenses/$pkgname
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir"
    cargo install --root="$srcdir" --git="$url" --no-track --all-features
}

package() {
    install -Dm 755 "$srcdir/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
    # GPL licences are provided in the /usr/share/licenses/spdx:
    # https://wiki.archlinux.org/title/PKGBUILD#license
}
