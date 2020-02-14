# Maintainer: Walter C <wcasanova at disroot dot org>

pkgname="click-git"
_pkgname="click"
pkgver=0.4.3.302.g8942cd5
pkgrel=1
pkgdesc="The 'Command Line Interactive Controller for Kubernetes'"
arch=("i686" "x86_64")
url="https://github.com/databricks/click"
license=("Apache")
depends=()
makedepends=("rust" "cargo" "git")
provides=("click")
conflicts=("click")
source=("$_pkgname::git+https://github.com/databricks/click.git")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)" | tr '-' '.'
}

build() {
    cd $_pkgname
    cargo build --release --locked
}
    
check() {
    cd $_pkgname
    cargo test --release --locked
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
