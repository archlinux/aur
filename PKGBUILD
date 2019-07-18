# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=openbox-themes-pambudi-git
pkgver=r24.b25c465
pkgrel=2
pkgdesc="Openbox themes from Adhi Pambudi"
arch=('x86_64')
url="https://github.com/addy-dclxvi/openbox-theme-collections"
license=('GPL3')
depends=('git' 'openbox')
source=(${pkgname}::"git+https://github.com/addy-dclxvi/openbox-theme-collections")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p ${pkgdir}/usr/share/themes
  rm *.jpg
  rm LICENSE
  rm README.md
  cp -r * ${pkgdir}/usr/share/themes
}
