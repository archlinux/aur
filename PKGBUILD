# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=pacfetch-git
pkgver=0.0.3
pkgrel=1
pkgdesc="Simple fetch script for pacman based distros. Written in Rust."
url="https://git.auteiy.me/dmitry/pacFetch"
license=('GPL3')
provides=('pacfetch')
conflicts=('pacfetch-bin')
depends=(
    gcc-libs
)
makedepends=(
    rust
    cargo
)
source=("pacfetch-git-$pkgver-$pkgrel::git+$url.git")

# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('SKIP')

arch=('x86_64')

build() {
    cd pacfetch-git-$pkgver-$pkgrel
    cargo build --release
}

package() {
    cd "$srcdir/pacfetch-git-$pkgver-$pkgrel"

    # Install Binary
    install -Dm755 "./target/release/pacfetch" "$pkgdir/usr/bin/pacfetch"
}
