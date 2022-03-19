# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Username-08 <youremail@domain.com>
pkgname=lightnovel-cli-git
pkgver=r2.5032f73
pkgrel=1
epoch=
pkgdesc="A simple program to read lightnovels in the terminal"
arch=('x86_64' 'i686')
url="https://github.com/Username-08/lightnovel-cli.git"
license=('MIT')
groups=()
depends=(ncurses)
makedepends=(git rust)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("lightnovel-cli-git::git+https://github.com/Username-08/lightnovel-cli.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    if command -v rustup > /dev/null 2>&1; then
        RUSTFLAGS="-C target-cpu=native" rustup run nightly \
        cargo build --release
    elif rustc --version | grep -q nightly; then
        RUSTFLAGS="-C target-cpu=native" \
        cargo build --release
    else
        cargo build --release
    fi
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/lightnovel-cli "$pkgdir/usr/bin/lightnovel-cli"
}
