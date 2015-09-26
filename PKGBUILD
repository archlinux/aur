# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=batman-adv
pkgver=2015.1
pkgrel=2
pkgdesc='batman kernel module'
arch=('i686' 'x86_64')
url='http://www.open-mesh.net/'
license=('GPL')
install='batman-adv.install'
source=("http://downloads.open-mesh.org/batman/releases/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'batman-adv.install'
        '0001-batman-adv-don-t-access-unregistered-net_device-obje.patch'
        '0002-batman-adv-Add-lower-layer-needed_-head-tail-room-to.patch'
        '0003-batman-adv-Fix-memory-leak-on-tt-add-with-invalid-vl.patch'
        '0004-batman-adv-Remove-unnecessary-braces-for-test_bit-in.patch'
        '0005-batman-adv-Remove-unnecessary-braces-for-test_bit-in.patch'
        '0006-batman-adv-Remove-unnecessary-braces-for-test_bit-in.patch'
        '0007-batman-adv-fix-speedy-join-for-DAT-cache-replies.patch'
        '0008-batman-adv-avoid-keeping-false-temporary-entry.patch'
        '0009-batman-adv-detect-local-excess-vlans-in-TT-request.patch'
        '0010-batman-adv-decrease-maximum-fragment-size.patch'
)
depends=('linux')
makedepends=('linux-headers')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for s in "${source[@]}"
  do
          case "$s" in
                  (*.patch)
                          patch -p1 < "${srcdir}/${s}"
          esac
  done
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make KERNELPATH=/usr/lib/modules/$(uname -r)/build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 net/batman-adv/batman-adv.ko "${pkgdir}/usr/lib/modules/$(uname -r)/updates/net/batman-adv/batman_adv.ko"
  install -D -m644 README "${pkgdir}/usr/share/doc/batman-adv/README"
}

sha256sums=('62ff9b769ada746e7a373a048ca8036fbd73f81c63053bbbe25fa24b4343dd0d'
            '347599c02426a905690002885c277f91b82da2b29d3372348e5f02d03c435c37'
            '39e6e3c64339e894b4a58a0a4b9703eabb865a3df0035b54dbd84b068838941f'
            'a3d07361c73ca4251e23ee2f3226a0cd9c4102e0b99f7a2ae4fb1b9ae99a59ce'
            'd3cb5820656a9bd86169eb776fd6a49adc09ed4653ac9a7b5a5b851caa5723ae'
            'de5b23a93a73a61ec689e5773d9d70dfd09ec9f9ef0618941e9fea4101a9ae75'
            'e3b4e5843c1b80eeb1770d433d3a8f07a13e3b6fa8646e7ca24443eaf36de9c0'
            '55c5d1bdf3c2bdd113eeecb48cefb0d0e8939f0fd992fbaeb4a1ae1aac7b08c1'
            'e54578672879efb0329c0ba1ec0c79341296d3e7f15a47f37dc922a1cfc8b91d'
            'c39e8acf5733450570139a95b16109506c48bfa2db9f21eea51fd427ea302e66'
            '38042fc13e55ba0cae165592801e7e706d2c751f40418d710b3fc43e086ccdab'
            '87fa61b4b93577c73728cc3cd66a80871ee1852a2ea7ccccb80d0b63d9919b7c')
