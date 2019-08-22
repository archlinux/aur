# Maintainer: Peltoche <dev@halium.fr>
# Co-maintainer: Andrea Pascal <andrea@anodium.net>

pkgname="lsd-git"
_pkgname="lsd"
pkgver=0.16.0.381.gaa40bd2
pkgrel=1
pkgdesc="The next gen ls command"
arch=("i686" "x86_64" "armv6h" "armv7h")
url="https://github.com/Peltoche/lsd"
license=("Apache")
depends=("gcc-libs")
makedepends=("rust" "cargo" "git")
provides=("lsd")
conflicts=("lsd")
source=("$_pkgname::git+https://github.com/Peltoche/lsd.git")
sha384sums=("SKIP")

pkgver() {
    cd $_pkgname
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
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
    install -D -m755 $srcdir/$_pkgname/target/release/lsd $pkgdir/usr/bin/lsd
}
