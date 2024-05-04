# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor:  Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Contributor: Raziel23 <venom23 at runbox dot com>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Geoffrey Teale <tealeg@stop-squark>
# Contributor: Mark, Huo Mian <markhuomian[at]gmail[dot]com>
# Contributor: Biginoz <biginoz a free dot fr>
# Contributor: schalox <schalox at gmail dot com>

pkgname=redshift-minimal
_name=redshift
pkgver=1.12
pkgrel=5
pkgdesc="Adjusts the color temperature of your screen according to your surroundings, with minimal dependencies."
arch=('i686' 'x86_64')
url='http://jonls.dk/redshift/'
license=('GPL3')
makedepends=('intltool' 'libxcb')
depends=('glibc' 'libxcb')
conflicts=('redshift')
provides=('redshift')
source=("https://github.com/jonls/${_name}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.xz")
sha256sums=('d2f8c5300e3ce2a84fe6584d2f1483aa9eadc668ab1951b2c2b8a03ece3a22ba')

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  ./configure --disable-gui --disable-vidmode \
              --disable-geoclue2 \
              --disable-ubuntu --disable-drm \
              --prefix=/usr --with-systemduserunitdir=/usr/lib/systemd/user
  make
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}/usr/lib/systemd/user/${_name}-gtk.service"
}
