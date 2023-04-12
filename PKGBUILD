# Maintainer: Emma Tebibyte <emma@tebibyte.media>

_pkgbase="breed"
pkgname="$_pkgbase-git"
pkgver=0.1.0
pkgrel=1
pkgdesc="A small modal editor designed to breed productivity."
arch=("any")
url="https://git.tebibyte.media/mars/$_pkgbase"
license=("AGPL3")
source=("git+https://git.tebibyte.media/mars/$_pkgbase")
makedepends=("rust" "cargo" "git")
provides=("breed")

sha256sums=("SKIP")

pkgver() {
  cd $_pkgbase
  cargo pkgid | cut -d# -f2 | cut -d: -f2
}

prepare() {
    cd $srcdir/$_pkgbase
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

package() {
    cd $srcdir/$_pkgbase
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path . --target="$CARCH-unknown-linux-gnu"
}
