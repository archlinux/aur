# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=muon-meson-git
_pkgname=${pkgname%-meson-git}
pkgver=r322.2a59d24
pkgrel=1
pkgdesc='meson implementation in C'
url='https://sr.ht/~lattis/muon'
license=(GPL-3.0)
arch=(x86_64)
depends=(pkgconf curl zlib)
makedepends=(git meson)
conflicts=()
provides=(muon)
source=("git+https://git.sr.ht/~lattis/muon")
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
  meson build
  ninja -C build
}

package() {
  cd "$_pkgname"
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
