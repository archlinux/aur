# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoża <piotr dot r dot public at gmail dot com>

pkgname=pyexiftoolgui-git
pkgver=0.5.r43.17c7a0e
pkgrel=1
pkgdesc='A python pyside graphical frontend for the excellent open source command line tool ExifTool.'
arch=('any')
url='https://github.com/hvdwolf/pyExifToolGUI'
license=('GPL')
groups=()
depends=(python2-pyside perl-image-exiftool)
makedepends=(git desktop-file-utils python2)
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install="${pkgname%-git}.install"
noextract=()
source=(fix.patch)
md5sums=('eb148b3f802330500e82c5dc26d3b554')
_gitrepo="$url.git"

prepare() {
  # The other branch is huge > 100 MB, so we do it old school
  git clone --single-branch $_gitrepo "$srcdir/${pkgname%-git}"
	cd "$srcdir/${pkgname%-git}"
  patch -p1 -N < $srcdir/fix.patch
}
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}
package(){
	cd "$srcdir/${pkgname%-git}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
