# Maintainer: sballert <sballert@posteo.de>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-all-the-icons
pkgver=3.2.0
pkgrel=1
pkgdesc="A utility package to collect various Icon Fonts and propertize them within Emacs."
url="https://github.com/domtronn/all-the-icons.el"
arch=('any')
license=('MIT')
depends=('emacs' 'emacs-memoize' 'ttf-font-awesome' 'ttf-material-design-icons' 'ttf-weather-icons' 'ttf-octicons' 'ttf-atom-file-icons' 'ttf-all-the-icons')
makedepends=('git')
provides=('emacs-all-the-icons')
source=("$pkgname-$pkgver.tar.gz::https://github.com/domtronn/all-the-icons.el/archive/${pkgver}.tar.gz")
sha256sums=('09fa8fff3ae65ea77089b17a270221d016d7df5c6093ef36357572235e36c7cb')
install=${pkgname}.install

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

  install -D -m644 data/* "${pkgdir}/usr/share/emacs/site-lisp/all-the-icons/data/"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
