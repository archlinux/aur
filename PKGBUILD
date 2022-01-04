# Maintainer: andrea denisse <denisse@archlinux.org>

pkgname=otf-mplus-git
pkgdesc='A little nifty font family for everyday usage'
pkgver=r235.a126863
pkgrel=2
arch=('any')
license=('OFL')
url='https://mplusfonts.github.io/'
source=('otf-mplus::git+https://github.com/coz-m/MPLUS_FONTS.git#branch=master')
sha256sums=('SKIP')
makedepends=('git')
provides=("otf-mplus")
conflicts=("otf-mplus")

pkgver() {
  cd otf-mplus
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd otf-mplus
  install -Dm644 fonts/otf/*.otf -t "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/otf-mplus/COPYING"
}
