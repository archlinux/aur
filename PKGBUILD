# Maintainer: Que Quotion <quequotion at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=dm2-alsa
pkgver=r651M
pkgrel=4
pkgdesc='Mixman DM2 ALSA driver'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/dm2linux/'
license=('GPL2')
depends=('alsa-lib')
makedepends=('svn')
provides=("${pkgname}"="${pkgver}")
install=dm2-alsa.install
source=('svn+svn://svn.code.sf.net/p/dm2linux/code/trunk'
        no-depmod)
sha256sums=('SKIP'
            '9dd4e03673f6eba409f44227348e06d7e7b28200c98a53f08c1406bb4cd0a10b')

pkgver() {
  cd "$srcdir/trunk"
  echo "r$(svnversion)"
}

prepare() {
  cd trunk/dm2_alsa/
  patch -Np3 < ../../no-depmod
}

build() {
  cd trunk/dm2_alsa/
  make
}

package() {
  cd trunk/dm2_alsa/

  make DESTDIR="${pkgdir}/usr/" install
}

