# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Thomas Weißschuh <thomas t-8ch de>
# Contributor: RubenKelevra <ruben@vfn-nrw.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=batman-adv
pkgver=2020.1
pkgrel=1
epoch=1
pkgdesc='Batman kernel module'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://www.open-mesh.net/'
license=('GPL')
depends=('libnl')
makedepends=('linux-headers')
install='batman-adv.install'
source=("https://downloads.open-mesh.org/batman/releases/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'batman-adv.install'
)
depends=('linux')
makedepends=('linux-headers')
sha256sums=('23abf5576d4594c36a5b6a775f8d2bbd0025f004a8980f68358484f4a0730fbb'
            '347599c02426a905690002885c277f91b82da2b29d3372348e5f02d03c435c37')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make KERNELPATH=/usr/lib/modules/$(uname -r)/build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 build/net/batman-adv/batman-adv.ko "${pkgdir}/usr/lib/modules/$(uname -r)/updates/net/batman-adv/batman_adv.ko"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" README.external.rst \
    CHANGELOG.rst MAINTAINERS
}

