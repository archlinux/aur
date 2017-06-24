
# Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>

_pkgbase=hardcode-tray
_gitname=Hardcode-Tray
pkgname=$_pkgbase
pkgver=4.0
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
sha256sums=('432ed1bb9d13e04344838ccd8259f91e4303e82138b3080bad9a52235c313bec')


build() {
	cd "$srcdir/${_gitname}-${pkgver}"
	meson builddir --prefix=/usr
}

package() {
	cd "$srcdir/${_gitname}-${pkgver}"
	DESTDIR="${pkgdir}" ninja -C builddir install
}
