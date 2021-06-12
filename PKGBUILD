# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=scdoc-git
_pkgname=${pkgname%-git}
pkgver=1.11.1.r3.gc7cb8be
pkgrel=1
pkgdesc="Small man page generator"
url='https://sr.ht/~sircmpwn/scdoc/'
license=(custom)
arch=(x86_64)
depends=()
makedepends=(make clang)
conflicts=()
provides=(scdoc)
source=("git+https://git.sr.ht/~sircmpwn/scdoc")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  CC=clang make all
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
