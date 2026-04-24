# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=kaobook-git
pkgver=0.9.7.r99.g22225a1
pkgrel=1
pkgdesc='A LaTeX class for books, reports or theses'
url='https://github.com/fmarotta/kaobook'
arch=('any')
license=('LPPL-1.3c')

provides=(
  'kaobook'
)
conflicts=(
  'kaobook'
)

depends=(
  'otf-libertinus'
  'texlive-bin'
  'ttf-liberation'
)
makedepends=(
  'git'
)

source=(
  'git+https://github.com/fmarotta/kaobook.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd kaobook
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd kaobook

  # Remove obsolete xcolor option until https://github.com/fmarotta/kaobook/pull/314 is merged.
  sed -i -e's|RequirePackage\[usenames,dvipsnames,table\]{xcolor}|RequirePackage[dvipsnames,table]{xcolor}|' kao.sty
}

package() {
  cd kaobook
  install -Dm644 kaobook.cls -t "$pkgdir"/usr/share/texmf/tex/latex/kaobook/
  install -Dm644 kaohandt.cls -t "$pkgdir"/usr/share/texmf/tex/latex/kaobook/
  install -Dm644 kao.sty -t "$pkgdir"/usr/share/texmf/tex/latex/kaobook/
  install -Dm644 kaobiblio.sty -t "$pkgdir"/usr/share/texmf/tex/latex/kaobook/
  install -Dm644 kaorefs.sty -t "$pkgdir"/usr/share/texmf/tex/latex/kaobook/
  install -Dm644 kaotheorems.sty -t "$pkgdir"/usr/share/texmf/tex/latex/kaobook/
}
