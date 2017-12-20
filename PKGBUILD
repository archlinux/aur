# Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>

_pkgbase=hardcode-tray
_gitname=Hardcode-Tray
pkgname=$_pkgbase
pkgver=4.2
pkgrel=1
pkgdesc="Fixes Hardcoded Tray Icons"
arch=('i686' 'x86_64')
url="https://github.com/bil-elmoussaoui/${_gitname}"
license=('GPL-3.0')
provides=("$_pkgbase")
conflicts=("hardcode-tray-fixer-git" "hardcode-tray-git")
makedepends=('ninja' 'meson')
depends=('python' 'python-gobject' 'python-cairosvg' 'librsvg' 'gtk3')
optdepends=('sni-qt-patched-git: patched qt4 sni plugin to enable icon modification' 'inkscape: to convert svg to png with inkscape' 'imagemagick: used to convert svg to png')
optdepends_x86_64=('lib32-sni-qt-patched-git: 32-bit patched qt4 sni plugin to enable icon modification')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('58e1d246a2ead600ac82cf2d83c22dad1659f0da2be825cf54d779e18a23ccc1')


build() {
  cd "$srcdir/${_gitname}-${pkgver}"
  meson builddir --prefix=/usr
}

package() {
  cd "$srcdir/${_gitname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C builddir install
}
