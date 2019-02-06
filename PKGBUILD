# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=leggie-git
_pkgname=${pkgname%-git}
pkgver=r35.05aeb28
pkgrel=1
pkgdesc="A pretty, legible 6x12, 8/9x14, 8/9x16, 9x18, 12x24 bitmap font with over 1700 glyphs. Perfect for terminals and text editors."
url="https://github.com/wiktor-b/leggie"
arch=(any)
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=("bdf2psf")
makedepends=("git")
license=("CCPL")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd ${_pkgname}
  make install BDFDEST="$pkgdir/usr/share/fonts/" PSFDEST="$pkgdir/usr/share/kbd/consolefonts/"
}
