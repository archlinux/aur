# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xorg-xrdb-mcpp
_pkgname=xorg-xrdb
pkgver=1.2.1
pkgrel=1
pkgdesc="X server resource database utility"
arch=('x86_64' 'i686')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('libx11' 'libxmu')
makedepends=('xorg-util-macros')
optdepends=('gcc: for preprocessing'
            'mcpp: a lightweight alternative for preprocessing')
groups=('xorg-apps' 'xorg')
source=(https://xorg.freedesktop.org/archive/individual/app/xrdb-${pkgver}.tar.bz2{,.sig})
sha512sums=('d88135cdfea8536523dfb986249ee42761d5363c936352f12f55b4d0c849f21236f7d74d39869c5ec5b549019d6ed89d9096cde4b3c2b4816c2778a8e370b5c9'
            'SKIP')
#validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"
validpgpkeys=('C41C985FDCF1E5364576638B687393EE37D128F8') # "Matthieu Herrb <matthieu.herrb@laas.fr>"

provides=($_pkgname=$pkgver)
conflicts=($_pkgname)

build() {
  cd xrdb-${pkgver}
  # --with-cpp=path       comma-separated list of paths to cpp command for xrdb to use at runtime
  # mcpp is small but can fail, FS#46934
  ./configure --prefix=/usr --with-cpp=/usr/bin/mcpp,/usr/bin/cpp
  make
}

package() {
  cd xrdb-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
