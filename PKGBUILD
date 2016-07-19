# Maintainer: Jan Holthuis <holthuis.jan@gmail.com>
pkgname=beamer-theme-rub-git
pkgver=r38.171a625
pkgrel=1
pkgdesc="Beamer theme for the Ruhr-University of Bochum"
arch=(any)
url="https://github.com/sjewo/rub-beamer"
license=('unknown')
depends=('texlive-core')
makedepends=('git')
conflicts=('beamer-theme-rub')
provides=('beamer-theme-rub')
source=("git+https://github.com/sjewo/rub-beamer.git")
install="${pkgname}.install"
optdepends=('rubtexfonts2009: RUB corporate design font support')
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/rub-beamer"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  TEXMFDIST=$(kpsewhich -var-value=TEXMFDIST)
  cd "${srcdir}/rub-beamer/tex/latex/rub-beamer"
  install -d -m755 "${pkgdir}/${TEXMFDIST}/tex/latex/rub-beamer"

  install -m644 beamercolorthemeRub.sty \
          "${pkgdir}/${TEXMFDIST}/tex/latex/rub-beamer/"
  install -m644 beamerfontthemeRub.sty \
          "${pkgdir}/${TEXMFDIST}/tex/latex/rub-beamer/"
  install -m644 beamericonarticle.pdf \
          "${pkgdir}/${TEXMFDIST}/tex/latex/rub-beamer/"
  install -m644 beamericonbook.pdf \
          "${pkgdir}/${TEXMFDIST}/tex/latex/rub-beamer/"
  install -m644 beamerinnerthemeRub.sty \
          "${pkgdir}/${TEXMFDIST}/tex/latex/rub-beamer/"
  install -m644 beamerouterthemeRub.sty \
          "${pkgdir}/${TEXMFDIST}/tex/latex/rub-beamer/"
  install -m644 beamerthemeRub.sty \
          "${pkgdir}/${TEXMFDIST}/tex/latex/rub-beamer/"

  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 "${srcdir}/rub-beamer/README.md" \
          "${pkgdir}/usr/share/doc/${pkgname}/"
}
