# Maintainer: Chan Beom Park <cbpark@gmail.com>

pkgname=pmix
pkgver=2.1.1
pkgrel=2
pkgdesc='Process Management Interface Exascale'
url='https://pmix.github.io/pmix/'
arch=('x86_64')
license=('custom:OpenMPI')
conflicts=('openmpi' 'slurm-llnl')
depends=('gcc-libs' 'libevent' 'zlib' 'libltdl' 'munge')
source=(https://github.com/pmix/pmix/releases/download/v2.1.1/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('1530a40d76474ebdd98581d2c6d4be57c928e69a2b86e11afc4643fde2a667e0')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --with-libevent=/usr \
              --with-zlib=/usr \
              --with-libltdl=/usr \
              --with-munge=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
