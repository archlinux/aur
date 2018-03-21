# Contributor: AkiraYB <brunoyb!outlook,com>
# Maintainer: Stefan Husmann <Stefan-Husmann@t-online.de>

pkgname=emacs-pov-mode
pkgver=3.3
pkgrel=4
pkgdesc='POV-Ray mode for Emacs'
arch=('any')
url='http://xahlee.org/3d/povray_emacs.html'
license=('GPL3')
depends=('emacs')
source=("http://www.imagico.de/imenu/povray-imenu-3.6.tar.gz"
	"$pkgname-$pkgver.tar.gz::https://github.com/emacsmirror/pov-mode/archive/v$pkgver.tar.gz")
sha256sums=('c99e00f3ba1de305b9859af43be4fbb4caf54426479461b9922dd7b2989c038b'
            'e2fc53d4f41b90b626d11c778ab7cd20a0d26efd8abb3ce860d47c695121bae7')
noextract=(povray-imenu-3.6.tar.gz)

prepare() {
  cd ${pkgname#emacs-}-$pkgver
  sed -e '/pov-include-dir/ s|3.6|3.7|' \
      -e '/pov-include-dir/ s|/local||' \
      -e '/pov-documentation-directory/ s|3.6|3.7|' \
      -e '/pov-documentation-directory/ s|/local||' \
      -e '/pov-documentation-directory/ s|html|doc/html|' -i pov-mode.el
}

package() {
  cd ${pkgname#emacs-}-$pkgver
  
  local _infodir="${pkgdir}"/usr/share/info
  local _installdir="${pkgdir}"/usr/share/emacs/site-lisp/pov-mode
  
  install -d ${_infodir} ${_installdir}/InsertMenu
  
  install -m 644 pov-mode.info $_infodir
  install -m 644 pov-mode.el povrender.xpm povview.xpm $_installdir
  
  bsdtar -xof "${srcdir}"/povray-imenu-3.6.tar.gz \
	 -C ${_installdir}/InsertMenu
}
