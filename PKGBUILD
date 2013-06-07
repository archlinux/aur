# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=batman-adv
pkgver=2013.2.0
pkgrel=1
pkgdesc="batman kernel module, (included upstream since .38)"
arch=('i686' 'x86_64')
url="http://www.open-mesh.net/"
license=('GPL')
install='batman-adv.install'
source=("http://downloads.open-mesh.org/batman/releases/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "batman-adv.install")
depends=("linux")
makedepends=("linux-headers")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make KERNELPATH=/usr/lib/modules/$(uname -r)/build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 batman-adv.ko "${pkgdir}/usr/lib/modules/$(uname -r)/updates/net/batman-adv/batman_adv.ko"
  install -D -m644 README "${pkgdir}/usr/share/doc/batman-adv/README"
}

sha256sums=('0eda171033434cc7971c1d44e3156f2b11984ba9231d6e85ef27ac3548eb41f0'
            '347599c02426a905690002885c277f91b82da2b29d3372348e5f02d03c435c37')
