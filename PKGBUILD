# Maintainer: Jordi Pakey-Rodriguez <jordi at 0xdec dot im>
pkgname=ttf-material-design-icons-desktop-git
pkgver=r1168.2977b80
pkgrel=1
pkgdesc="Material Design Icons Desktop Font"
arch=('any')
url='https://materialdesignicons.com'
license=('custom:PFL')
makedepends=('git')
source=('git+https://github.com/Templarian/MaterialDesign-Font.git')
md5sums=('SKIP')

pkgver() {
  cd MaterialDesign-Font
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd $srcdir/MaterialDesign-Font
  install -D -m644 "MaterialDesignIconsDesktop.ttf" "${pkgdir}/usr/share/fonts/TTF/MaterialDesignIconsDesktop.ttf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
