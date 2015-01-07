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
pkgrel=2
pkgdesc="Adjusts the color temperature of your screen according to your surroundings, with minimal dependencies.."
arch=('i686' 'x86_64')
url='http://jonls.dk/redshift/'
license=('GPL3')
depends=('libxxf86vm')
makedepends=('python' 'intltool')
conflicts=('redshift')
provides=('redshift')
source=("https://github.com/jonls/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('f7a1ca1eccf662995737e14f894c2b15193923fbbe378d151e346a8013644f16')

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  ./bootstrap
  PYTHON=/usr/bin/python ./configure --disable-gui \
                                     --disable-geoclue --enable-geoclue2 \
                                     --disable-ubuntu --disable-drm \
                                     --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}/usr/lib/systemd/user/${_name}-gtk.service"
}

