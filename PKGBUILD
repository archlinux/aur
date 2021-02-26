# Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>

_pkgbase=hardcode-tray
_gitname=Hardcode-Tray
pkgname=$_pkgbase
pkgver=4.3
pkgrel=3
pkgdesc="Fixes Hardcoded Tray Icons"
arch=('i686' 'x86_64')
url="https://github.com/bil-elmoussaoui/${_gitname}"
license=('GPL-3.0')
provides=("$_pkgbase")
conflicts=("hardcode-tray-fixer-git" "hardcode-tray-git")
makedepends=('ninja' 'meson')
depends=('python' 'gobject-introspection' 'python-gobject'
'python-cairosvg' 'librsvg' 'gtk3')
optdepends=('sni-qt-patched-git: patched qt4 sni plugin to enable icon modification' 'inkscape: to convert svg to png with inkscape' 'imagemagick: used to convert svg to png')
optdepends_x86_64=('lib32-sni-qt-patched-git: 32-bit patched qt4 sni plugin to enable icon modification')
source=(${url}/archive/v${pkgver}.tar.gz ${pkgname}.patch)
sha256sums=('5f64c5a1083b8cefc07ba3a218bb0258f7846d9c0d04dae6f91c2478e288f0e1'
            '998abc88d649b39e1a56f6a642faf041432da4fdfae8bb875bc9c4e66e6e367e')

prepare() {
    cd "$srcdir/${_gitname}-${pkgver}"
    patch -p1 -i ../${pkgname}.patch
}

build() {
  cd "$srcdir/${_gitname}-${pkgver}"
  meson builddir --prefix=/usr
}

package() {
  cd "$srcdir/${_gitname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C builddir install
}
