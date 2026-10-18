# $Id: PKGBUILD 146968 2012-01-19 19:15:55Z eric $
# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Tobias Kieslich <tobias@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=autopano-sift-c
pkgver=2.5.1
pkgrel=6
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
  # CMake 4 refuses projects that require CMake < 3.5; the programs use libm without linking it
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_C_STANDARD_LIBRARIES=-lm .
  make
}

package() {
  cd "${srcdir}/autopano-sift-C-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
