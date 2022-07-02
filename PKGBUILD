# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=beamer-theme-hsrm-git
pkgver=r10.600bcdc
pkgrel=1
pkgdesc="Beamer theme that complies with the corporate design of the RheinMain University of Applied Sciences. "
arch=(any)
url="https://github.com/benjamin-weiss/hsrmbeamertheme"
license=('GLP')
depends=('texlive-core')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname}.install"
source=('git+https://github.com/benjamin-weiss/hsrmbeamertheme.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/hsrmbeamertheme
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir"/hsrmbeamertheme
  mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/theme
  install -m644 beamerthemehsrm.sty \
    "$pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/theme/"
}
