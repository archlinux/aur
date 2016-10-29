# Maintainer: Kevin Olbrich <kevin.olbrich@dolphin-it.de>
# Contributor: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: RubenKelevra

pkgname=batman-adv-optimized
_pkgname=batman-adv
pkgver=2016.4
pkgrel=0
epoch=1
pkgdesc='batman kernel module'
conflicts=('batman-adv')
provides=('batman-adv')
arch=('i686' 'x86_64')
url='https://www.open-mesh.net/'
license=('GPL')
install='batman-adv-optimized.install'
source=("https://downloads.open-mesh.org/batman/releases/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'batman-adv-optimized.install'
        '0001-batman-adv-Fix-speedy-join-in-gateway-client-mode.patch'
        '1001-batman-adv-introduce-no_rebroadcast-option.patch'
        '1002-batman-adv-decrease-maximum-fragment-size.patch'
)
depends=('linux')
makedepends=('linux-headers')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  for s in "${source[@]}"
  do
          case "$s" in
                  (*.patch)
                          #patch -p1 < "${srcdir}/${s}"
          esac
  done
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make KERNELPATH=/usr/lib/modules/$(uname -r)/build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  install -D -m644 net/batman-adv/batman-adv.ko "${pkgdir}/usr/lib/modules/$(uname -r)/updates/net/batman-adv/batman_adv.ko"
  install -D -m644 ../README "${pkgdir}/usr/share/doc/batman-adv/README"
}

sha256sums=('bc1236dd83209db51a09368b7ed1dd3a1ce5f5b933e09260c4d6f107c0a150eb'
            '347599c02426a905690002885c277f91b82da2b29d3372348e5f02d03c435c37'
            'b1425b0fa6268fc67b3f35b443c382d86ac0e8513b3f786a06695f90b36774ee'
            '7a876cccdb287fb9929cf1b33361334d78b6cd7cbb3f3fb0a3c9c261f335edaf'
            '1501d6fef6497461d2439505eeeb264f02f2ecfb06e7101908d72fc4d1953c14')
