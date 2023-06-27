# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Thomas Weißschuh <thomas t-8ch de>
# Contributor: RubenKelevra <ruben@vfn-nrw.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=batman-adv
pkgver=2023.1
pkgrel=1
epoch=1
pkgdesc='Batman kernel module'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://www.open-mesh.net/'
license=('GPL')
depends=('libnl' 'linux')
makedepends=('linux-headers')
install='batman-adv.install'
source=(https://downloads.open-mesh.org/batman/stable/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('f46a7286660a5ec3506a1be7ef60b471c51ac70550597d598040479ab7b936b8')


build() {
  cd "${pkgname}-${pkgver}"
  export CFLAGS="${CFLAGS} -fplt"
  echo $CFLAGS
  make KERNELPATH=/usr/lib/modules/$(uname -r)/build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -D -m644 net/batman-adv/batman-adv.ko "${pkgdir}/usr/lib/modules/$(uname -r)/updates/net/batman-adv/batman_adv.ko"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" README.external.rst \
    CHANGELOG.rst MAINTAINERS
}

