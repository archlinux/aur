# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=genpass-git
_pkgname=${pkgname%-git}
pkgver=v0.4.14.r1.bb4af7f
pkgrel=1
pkgdesc='A simple yet robust commandline random password generator.'
url='https://sr.ht/~cyplo/genpass'
license=(AGPL-3.0)
arch=(x86_64)
depends=()
makedepends=(cargo rust git)
conflicts=()
provides=(genpass)
source=("git+https://git.sr.ht/~cyplo/genpass")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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
