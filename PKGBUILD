# Maintainer: ljoonal <aur.lj at munally.com>

pkgname=vr-lighthouse-git
_pkgname=lighthouse
pkgver=1.3.1.r0.740b7a1
pkgrel=1
pkgdesc="VR Lighthouse power state management in Rust"
arch=('x86_64')
url="https://github.com/ShayBox/$_pkgname"
license=('MIT')
makedepends=('cargo')
# For manually building a specific version, comment out pkgver and uncomment the following:
# source=("git+$url#tag=$pkgver")
source=("git+$url")
b2sums=(
    'SKIP'
)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd $_pkgname
    cargo build --release
}

package() {
    install -Dm755 "$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
