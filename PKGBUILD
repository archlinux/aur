# See AUR interface for current maintainer.
# Contributor: Victor van den Elzen <victor.vde@gmail.com>

pkgname=emacs-color-theme-solarized
pkgver=1.0.0.beta2
pkgrel=1
pkgdesc="Solarized color theme for Emacs"
arch=(any)
url="http://ethanschoonover.com/solarized"
license=('MIT')
depends=('emacs' 'emacs-color-theme')
source=("http://ethanschoonover.com/solarized/files/solarized.zip")
sha256sums=('13e65141b4e46476acd94d97587a4770323ccf6f3b5ea5bf084c6c004f5e7866')

build() {
  cd "${srcdir}/solarized/emacs-colors-solarized"
  # sed -ie "s/:italic t//" color-theme-solarized.el # Disable italic comments
  emacs --batch --eval '(progn (push "." load-path) (byte-compile-file "color-theme-solarized.el"))'
}

package() {
  cd "${srcdir}/solarized/emacs-colors-solarized"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/themes"
  cp color-theme-solarized.{el,elc} "${pkgdir}/usr/share/emacs/site-lisp/themes/"
  mkdir -p "${pkgdir}/usr/share/licenses/emacs-color-theme-solarized"
  cp LICENSE "${pkgdir}/usr/share/licenses/emacs-color-theme-solarized/"
}

