# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: Max Niederman <max@maxniederman.com>

pkgname=ttyper-git
_pkgname=ttyper
pkgver=v0.2.0.r3.gc4c6b81
pkgrel=1
pkgdesc="Terminal-based typing test."
url="https://github.com/max-niederman/ttyper"
license=("MIT")
arch=("any")
makedepends=("cargo" "git")
provides=("ttyper")
source=('git+https://github.com/max-niederman/ttyper.git')
md5sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/$_pkgname
    export CARGO_TARGET_DIR="$srcdir/$_pkgname"
    cargo build --release
}

package() {
    cd $srcdir/$_pkgname
    export CARGO_TARGET_DIR="$srcdir/$_pkgname"

    mkdir -p $pkgdir/usr
    cargo install --path . --root "$pkgdir/usr"
    rm $pkgdir/usr/.crates.toml
    rm $pkgdir/usr/.crates2.json
}
