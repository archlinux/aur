# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=i3lock-next-git
pkgver=1
pkgrel=1
pkgdesc="Create a fancy image to use with i3lock."
arch=('i686' 'x86_64')
url="https://github.com/owenthewizard/i3lock-next"
license=('MIT')
depends=(i3lock-color-git imlib2 bash fontconfig libxrandr)
provides=(i3lock-next)
makedepends=(git)
source=("git+https://github.com/owenthewizard/i3lock-next/")
sha256sums=('SKIP')
_name=i3lock-next

pkgver() {
  cd "$_name"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_name"
  make PREFIX="$pkgdir"
}
package() {
  cd "$_name"
  make PREFIX="$pkgdir" LIBEXECDIR="$pkgdir"/lib install
}
