# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=beamer-theme-torino-git
pkgver=r3.d664ecb
pkgrel=1
pkgdesc="A pretty theme for LaTeX Beamer"
arch=(any)
url="https://github.com/bbatsov/beamer-torino-theme"
license=('unknown')
depends=('texlive-core')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname}.install"
source=('git+https://github.com/bbatsov/beamer-torino-theme.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/beamer-torino-theme
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir"/beamer-torino-theme
  mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/{color,inner,outer,theme}

  install -m644 themes/color/* \
    "$pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/color/"

  install -m644 themes/inner/beamerinnerthemefancy.sty \
    "$pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/inner/"

  install -m644 themes/outer/beamerouterthemedecolines.sty \
    "$pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/outer/"

  install -m644 themes/theme/beamerthemeTorino.sty \
    "$pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/theme/"
}
