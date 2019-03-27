# Maintainer: LinArcx <linarcx@gmail.com>

pkgname=estedad-fonts-git
pkgver=r481.f983410
pkgrel=1
pkgdesc="A Sans Serif Arabic-Latin text typeface"
url="https://github.com/aminabedi68/Estedad"
arch=(any)
license=('OFL')
depends=('fontconfig')
source=("${pkgname}::git+https://github.com/aminabedi68/Estedad")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${pkgname}"
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Font/ttf/*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}
