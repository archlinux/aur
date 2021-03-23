# Maintainer: Devin Singh <drsingh2518@icloud.com>
pkgname='bunnyfetch-git'
_pkgname="bunnyfetch"
pkgver=0.1.3.39.g22e2ab3
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/alacritty/alacritty"
pkgdesc="Tiny system info fetch utility."
license=('MIT')
makedepends=('rust' 'cargo' 'git')
depends=('gcc-libs')
provides=('bunnyfetch')
conflicts=('bunnyfetch')
source=("$_pkgname::git+https://github.com/Luvella/Bunnyfetch.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    cargo build --release
}

check() {
    cd $_pkgname
    cargo test --release
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/bunnyfetch "$pkgdir/usr/bin/bunnyfetch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
