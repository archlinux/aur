# Maintainer:  Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Contributor: Raziel23 <venom23 at runbox dot com>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Geoffrey Teale <tealeg@stop-squark>
# Contributor: Mark, Huo Mian <markhuomian[at]gmail[dot]com>
# Contributor: Biginoz <biginoz a free dot fr>

pkgname=redshift-minimal
_name=redshift
pkgver=1.8
pkgrel=1
pkgdesc="Adjusts the color temperature of your screen according to your surroundings, with minimal dependencies.."
arch=('i686' 'x86_64')
url='http://jonls.dk/redshift/'
license=('GPL3')
depends=('libxxf86vm')
makedepends=('python2')
conflicts=('redshift')
provides=('redshift')
source=("https://github.com/jonls/${_name}/archive/v${pkgver}.tar.gz")
md5sums=('8f81b58da2bbe7b62092c3b473f3d9a5')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  sed -i 's/python/python2/' src/redshift-gtk/redshift-gtk
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  autoreconf -fi
  PYTHON=/usr/bin/python2 ./configure --disable-gui --disable-gnome-clock \
                                      --disable-geoclue --disable-ubuntu \
                                      --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

