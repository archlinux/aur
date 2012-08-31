# Maintainer: Thomas Weißschuh <thomas_weissschuh@lavabit.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=batman-adv
pkgver=2012.3.0
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
  cd "${srcdir}"/${pkgname}-${pkgver}
  make KERNELPATH=/usr/lib/modules/$(uname -r)/build
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  install -D -m644 batman-adv.ko ${pkgdir}/usr/lib/modules/$(uname -r)/updates/net/batman-adv/batman_adv.ko
  install -D -m644 README ${pkgdir}/usr/share/doc/batman-adv/README
}

sha512sums=('7fb3549624cd05c450323840bfc1878b204a7348f43f80e20a4cfcc188e74ba2e7afaa4e7a4e0ed2b805e63c449fc4657db2054d1f8946b353d2176d8e5731d3'
            '4af18fcb6645124651c911bab8b58b5675d3af416ad42ca18545cb2709a08e81d9f8522d771dad26ded1801bcb31ebcf169c495456b62abb03502a30932835c6')
