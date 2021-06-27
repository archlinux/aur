# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=kiln-git
_pkgname=${pkgname%-git}
pkgver=0.2.1.r0.g7201859
pkgrel=1
pkgdesc="A simple static site generator"
url='https://sr.ht/~adnano/kiln'
license=(GPL-3.0)
arch=(x86_64)
depends=()
makedepends=(go scdoc)
conflicts=()
provides=(kiln)
source=("git+https://git.sr.ht/~adnano/kiln")
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
  make
}

package() {
  cd "$_pkgname"
  make PREFIX="$pkgdir/usr" install
}
