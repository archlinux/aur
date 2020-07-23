# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=yrmcds
pkgver=1.1.9
pkgrel=1
pkgdesc="A memory object caching system with master/slave replication"
arch=('x86_64')
url='http://cybozu.github.io/yrmcds'
license=('BSD')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cybozu/yrmcds/archive/v${pkgver}.tar.gz"
        'makefile.patch')
sha256sums=('657971ba691f95763ce3d2c3158d60b3c697a07a066b85f9a3d54f1e5cc4cd5d'
            'SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../makefile.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -av docs/* "${pkgdir}/usr/share/doc/${pkgname}"
}