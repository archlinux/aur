# $Id: PKGBUILD 146968 2012-01-19 19:15:55Z eric $
# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Tobias Kieslich <tobias@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=autopano-sift-c
pkgver=2.5.1
pkgrel=5
pkgdesc="Identify key feature points within arbitrary images"
arch=('i686' 'x86_64')
url="http://hugin.sourceforge.net/"
license=('GPL2')
depends=('libxml2' 'libpano13' 'gcc-libs' 'libtiff' 'bash' 'glibc')
makedepends=('cmake')
provides=('autopano-sift')
conflicts=('autopano-sift')
replaces=('autopano-sift')
source=(http://downloads.sourceforge.net/sourceforge/hugin/autopano-sift-C-${pkgver}.tar.gz)
md5sums=('b9bade07e8c4f2ea383c22a082c260e0')

build() {
  cd "${srcdir}/autopano-sift-C-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  sed -i 's/-lz/-lz -lm/' CMakeFiles/{autopano,generatekeys}.dir/link.txt
  make
}

package() {
  cd "${srcdir}/autopano-sift-C-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
