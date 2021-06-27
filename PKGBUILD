# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=ijq-git
_pkgname=${pkgname%-git}
pkgver=v0.3.5.r0.ga0abb27
pkgrel=1
pkgdesc="Interactive jq"
url='https://sr.ht/~gpanders/ijq'
license=(GPL-3.0)
arch=(x86_64)
depends=()
makedepends=(go scdoc)
conflicts=()
provides=(ijq)
source=("git+https://git.sr.ht/~gpanders/ijq")
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
  make prefix="$pkgdir/usr/" install
}
