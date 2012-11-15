# Maintainer: Thomas Weißschuh <thomas_weissschuh@lavabit.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=batman-adv
pkgver=2012.4.0
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

sha256sums=('11201cce7d18643a3d2358e7045cdeadd5ec6b9727d0c1bac6571fdd149ab0ad'
            '347599c02426a905690002885c277f91b82da2b29d3372348e5f02d03c435c37')
