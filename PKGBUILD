# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vector-bin
pkgver=0.9.1
pkgrel=1
pkgdesc='A lightweight and ultra-fast tool for building observability pipelines'
arch=('x86_64')
url="https://vector.dev"
license=('Apache')
provides=('vector')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/timberio/vector/releases/download/v${pkgver}/vector-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('efd640e1c664758b5451abb58654b3a8f818cf7f44b4d44f82d05071732e5f1e')

package() {
  cd "${srcdir}/vector-x86_64-unknown-linux-musl"
  install -Dm755 bin/vector $pkgdir/usr/bin/vector
  install -Dm644 etc/systemd/vector.service $pkgdir/etc/systemd/vector.service
  mkdir -p $pkgdir/etc/vector
  cp -aR config/* $pkgdir/etc/vector
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s /usr/share/licenses/common/Apache/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: