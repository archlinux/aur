# Maintainer: Chan Beom Park <cbpark@gmail.com>

pkgname=pmix
pkgver=3.1.4
pkgrel=1
pkgdesc='Process Management Interface Exascale'
url='https://pmix.org/'
arch=('x86_64')
license=('custom:OpenMPI')
conflicts=('openmpi')
depends=('gcc-libs' 'libevent' 'zlib' 'munge')
source=(https://github.com/pmix/pmix/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('0f3f575e486d8492441c34276d1d56cbb48b4c37')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --disable-pmi-backward-compatibility \
              --with-libevent \
              --with-zlib \
              --with-munge
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
