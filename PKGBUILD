# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=beamer-theme-kalgan-mule-git
pkgver=r4.9b61330
pkgrel=1
pkgdesc="Kalgan template and mule colour scheme for beamer presentations"
arch=(any)
url="https://github.com/kartikprabhu/Kalgan-Mule-template"
license=('unknown')
depends=('texlive-core')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname}.install"
source=('git+https://github.com/kartikprabhu/Kalgan-Mule-template.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/Kalgan-Mule-template
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir"/Kalgan-Mule-template
  mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/{color,theme}
  install -m644 beamercolorthememule.sty \
    "$pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/color/"

  install -m644 beamerthemeKalgan.sty \
    "$pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/theme/"
}
