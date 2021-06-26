# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=vlang-coreutils-git
_pkgname=coreutils
pkgver=r4.a665583
pkgrel=1
pkgdesc="coreutils in V"
url='https://github.com/vlang/coreutils'
license=(MIT)
arch=(x86_64)
depends=()
makedepends=(vlang make)
conflicts=() # Conflicts in a way with 'coreutils' but it's required by Arch Linux
provides=(false true) # Please update if new commands are commited
source=("git+https://github.com/vlang/coreutils.git")
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
}

package() {
  cd "$_pkgname"
  DESTDIR="$pkgdir/usr/bin" make
}
