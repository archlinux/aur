# Maintainer:  Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Geoffrey Teale <tealeg@stop-squark>
# Contributor: Mark, Huo Mian <markhuomian[at]gmail[dot]com>
# Contributor: Biginoz <biginoz a free dot fr>

pkgname=redshift-minimal
_origpkgname=redshift
pkgver=1.7
pkgrel=6
pkgdesc="Adjusts the color temperature of your screen according to your surroundings, with minimal dependencies.."
arch=('i686' 'x86_64')
url='http://jonls.dk/redshift/'
license=('GPL3')
depends=('libxxf86vm')
makedepends=('python2')
conflicts=('redshift')
provides=('redshift')
source=("https://launchpad.net/${_origpkgname}/trunk/${pkgver}/+download/${_origpkgname}-${pkgver}.tar.bz2")
md5sums=('c56512afa292b5a94b715ed4a1841d4c')

build() {
  cd "${srcdir}/${_origpkgname}-${pkgver}"

  sed -i 's/python/python2/' src/gtk-redshift/gtk-redshift

  PYTHON=/usr/bin/python2 ./configure --disable-gui --disable-gnome-clock \
                                      --disable-geoclue --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_origpkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
