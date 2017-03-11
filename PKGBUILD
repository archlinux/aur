# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Ionut Biru  <ibiru@archlinux.ro>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>

pkgname=geany-gtk3
_pkgname=geany
pkgver=1.30
pkgrel=1
pkgdesc='Fast and lightweight IDE'
arch=('x86_64' 'i686')
url='http://www.geany.org/'
license=('GPL')
depends=('gtk3' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('perl-xml-parser' 'intltool')
optdepends=('geany-plugins-gtk3: various extra features'
            'vte3: terminal support'
            'python2')
provides=('geany')
conflicts=('geany')
source=("http://download.geany.org/${_pkgname}-$pkgver.tar.bz2")
md5sums=('3abd397d528ae95e4e267225bf8419a7')

prepare() {
cd "${_pkgname}-$pkgver"

# Python2 fix
sed -i '0,/on/s//on2/' data/templates/files/main.py

# Syntax highlighting for PKGBUILD files
sed -i 's/Sh=/Sh=PKGBUILD;/' data/filetype_extensions.conf
# getver: geany.org/Documentation/ChangeLog
}

build() {
cd "${_pkgname}-$pkgver"

./configure --prefix=/usr --enable-gtk3
make
}

package() {
make -C "${_pkgname}-$pkgver" DESTDIR="$pkgdir" install
}

