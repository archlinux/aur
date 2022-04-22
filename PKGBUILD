# Maintainer: yuhldr <yuhldr@qq.com>
# Maintainer: Chan Beom Park <cbpark@gmail.com>

pkgname=pmix4
pkgver=4.1.2
pkgrel=1
pkgdesc='only pmix4, Process Management Interface Exascale'
url='https://pmix.org/'
arch=('x86_64')
license=('custom:OpenMPI')
conflicts=('openmpi' 'pmix')
depends=('glibc' 'libevent' 'hwloc' 'zlib')
source=(https://github.com/pmix/pmix/releases/download/v${pkgver}/pmix-${pkgver}.tar.bz2)
sha1sums=('64d66d1897de64d7ae3ded2f90ad9e5e676d9b32')

build() {
  cd pmix-${pkgver}
  ./configure --prefix=/usr \
              --disable-pmi-backward-compatibility \
              --with-libevent \
              --with-zlib \
              --with-hwloc

  make
}

package() {
  cd pmix-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
