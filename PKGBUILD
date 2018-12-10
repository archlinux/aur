# Maintainer: Chan Beom Park <cbpark@gmail.com>

pkgname=pmix
pkgver=3.0.2
pkgrel=1
pkgdesc='Process Management Interface Exascale'
url='https://pmix.github.io/pmix/'
arch=('x86_64')
license=('custom:OpenMPI')
conflicts=('openmpi')
depends=('gcc-libs' 'libevent' 'zlib' 'munge')
source=(https://github.com/pmix/pmix/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('3a1c253cb078a9088e9a0a513f3a40e2f7f29cb8')

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
