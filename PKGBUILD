# Maintainer: CallMeEchoCodes <romanbarrettsarpi@pm.me>
_pkgname=fetcho
pkgname=${_pkgname}-git
pkgver=r5.a6328a5
pkgrel=1
pkgdesc='A simple fetch made in C++'
arch=('any')
url="https://github.com/CallMeEchoCodes/fetcho"
license=('MPL-2.0')
provides=( fetcho )
conflicts=( "${_pkgname}" )
source=("${_pkgname}::git+${url}.git")
package() {
   install -Dm755 "$srcdir/fetcho/build/release/bin/fetcho" "$pkgdir/usr/bin/fetcho"
}
build() {
   make RELEASE=1 -C "$srcdir/fetcho" build
}
pkgver() {
   cd "$_pkgname"
   ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
   )
}
depends=('procps-ng')
sha256sums=('SKIP')
