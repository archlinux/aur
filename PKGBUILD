# Maintainer: Emma Tebibyte <emma@tebibyte.media>

_pkgbase="breed"
pkgname="$_pkgbase-git"
pkgver=r70.2976fb4
pkgrel=4
pkgdesc="A small modal editor designed to breed productivity."
arch=("any")
url="https://git.tebibyte.media/mars/$_pkgbase"
license=("AGPL3")
source=("git+https://git.tebibyte.media/mars/$_pkgbase")
makedepends=("rust" "cargo" "git" "clang")
provides=("breed")

sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgbase"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

package() {
    cd "$srcdir/$_pkgbase"
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
}
