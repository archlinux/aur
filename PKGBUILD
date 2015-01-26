# Maintainer:  Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Contributor: Raziel23 <venom23 at runbox dot com>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Geoffrey Teale <tealeg@stop-squark>
# Contributor: Mark, Huo Mian <markhuomian[at]gmail[dot]com>
# Contributor: Biginoz <biginoz a free dot fr>
# Contributor: schalox <schalox at gmail dot com>

pkgname=redshift-minimal
_name=redshift
pkgver=1.10
pkgrel=3
pkgdesc="Adjusts the color temperature of your screen according to your surroundings, with minimal dependencies.."
arch=('i686' 'x86_64')
url='http://jonls.dk/redshift/'
license=('GPL3')
depends=('libxxf86vm')
makedepends=('intltool')
conflicts=('redshift')
provides=('redshift')
source=("https://github.com/jonls/${_name}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.xz")
sha256sums=('5bc2e70aa414f42dafb45c6e06ea90157d7d4b298af48877144ff442639aeea6')

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  ./configure --disable-gui \
              --disable-geoclue --disable-geoclue2 \
              --disable-ubuntu --disable-drm \
              --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}/usr/lib/systemd/user/${_name}-gtk.service"
}