# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-all-the-icons
pkgver=2.5.0
pkgrel=1
pkgdesc="A utility package to collect various Icon Fonts and propertize them within Emacs."
url="https://github.com/domtronn/all-the-icons.el"
arch=('any')
license=('MIT')
depends=('emacs' 'emacs-font-lock-plus')
makedepends=('git')
provides=('emacs-all-the-icons')
source=("https://github.com/domtronn/all-the-icons.el/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/all-the-icons.el-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
  emacs -q --no-splash -batch -L . -f batch-byte-compile data/*.el
}

package() {
  cd "${srcdir}/all-the-icons.el-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/all-the-icons"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/all-the-icons/"

  mkdir ${pkgdir}/usr/share/emacs/site-lisp/all-the-icons/data/
  mkdir ${pkgdir}/usr/share/emacs/site-lisp/all-the-icons/fonts/

  install -D -m644 data/* "${pkgdir}/usr/share/emacs/site-lisp/all-the-icons/data/"
  install -D -m644 fonts/* "${pkgdir}/usr/share/emacs/site-lisp/all-the-icons/fonts/"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
