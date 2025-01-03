# AUR Package Maintainer: Alan <github dot com slash alan-ar1>
# Upstream Author / Project Maintainer: seatedro <me at seated dot ro>

_pkgbasename=glimpse
pkgname="$_pkgbasename-rust-git"
pkgver=r40.4208ee8
pkgrel=1
pkgdesc="A blazingly fast tool for peeking at codebases."
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/seatedro/$_pkgbasename"
license=('MIT')
makedepends=('git' 'cargo')
options=('!lto')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbasename"
   ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
   )
}

build() {
    cd "$srcdir/$_pkgbasename"
    cargo build --all-features --release
}

package() {
    cd "$srcdir/$_pkgbasename"
    install -Dm755 "target/release/$_pkgbasename" -t "$pkgdir/usr/bin/"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgbasename"
}

