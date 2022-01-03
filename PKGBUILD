# Maintainer: andrea denisse <denisse@archlinux.org>

pkgname=otf-mplus-git
_pkgname=${pkgname%-git}
pkgdesc='A little nifty font family for everyday usage'
pkgver=r235.a126863
pkgrel=1
arch=('any')
license=('OFL')
url='https://mplusfonts.github.io/'
_url='https://github.com/coz-m/MPLUS_FONTS'
_branch='master'
source=("$_pkgname::git+$_url.git#branch=$_branch")
sha256sums=('SKIP')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname" 'ttf-mplus' 'mplus-font' 'ttf-mplus-git')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$_pkgname"

  install -Dm644 fonts/otf/*.otf -t "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}
