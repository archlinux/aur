# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=gpgpass-git
_pkgname=${pkgname%-git}
pkgver=r23.388f5f8
pkgrel=1
pkgdesc="POSIX shell script for managing passwords"
url='https://sr.ht/~billy02357/gpgpass'
license=(GPL-3.0)
arch=(x86_64)
depends=(sh gnupg xclip dmenu)
makedepends=(git)
conflicts=()
provides=(gpgpass)
source=("git+https://git.sr.ht/~billy02357/gpgpass")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

