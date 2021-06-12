# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=gematom-git
_pkgname=${pkgname%-git}
pkgver=r16.69c66b0
pkgrel=1
pkgdesc='an atom feed generator for gemini written in rust'
url='https://sr.ht/~dr_tutut/gematom'
license=(GPL-3.0)
arch=(x86_64)
depends=()
makedepends=(cargo rust git)
conflicts=()
provides=(gematom)
source=("git+https://git.sr.ht/~dr_tutut/gematom")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
  cd "$_pkgname"
  cargo build --release
}

check() {
  cd "$_pkgname"
  cargo test --release
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
