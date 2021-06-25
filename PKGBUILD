# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=poe-git
_pkgname=${pkgname%-git}
pkgver=0.1.alpha.r11.g4a843ea
pkgrel=1
pkgdesc=".po file editor"
url='https://sr.ht/~strahinja/poe'
license=(GPL-3.0)
arch=(x86_64)
depends=()
makedepends=(gcc)
conflicts=()
provides=(poe)
source=("git+https://git.sr.ht/~strahinja/poe")
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
  ./do -d -c
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
