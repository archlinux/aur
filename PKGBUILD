# Maintainer: vitamin1980 <vitamin.novgorod @ yandex.ru>

pkgname=moxa-uport11x0-git-dkms
_pkgbase=moxa-uport11x0-git
pkgver=1.3.11
pkgrel=1
pkgdesc='Moxa UPort 11x0 USB to Serial Hub driver'
url='http://www.moxa.com/product/usb_to_serial_converters.htm'
arch=('i686' 'x86_64')
license=('GPL')
depends=('linux')
makedepends=('dkms' 'make' 'git')
conflicts=('moxa-uport11x0-git')
source=("https://github.com/ellysh/mxu11x0.git"
        "install"
        "dkms.conf"
        "mxu11x0.conf"  )
sha256sums=('SKIP'
            'd53916cbb5423019aa9afef654bc2bdd67df963efa199723a3bc8c76fe955517'
            '5061f16520a52fd74e48ecfe2bcaf90abf260bed4c826fca8342fe12fba70571'
            'a80410b68b562c731e80419eb77849766c0acaf4882d84dfe5d865221d3f3a76')

install=install

build() {
  git clone https://github.com/ellysh/mxu11x0.git
}

package() {
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  install -Dm644 mxu11x0.conf "${pkgdir}/usr/lib/modules-load.d/mxu11x0.conf"
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  cp -r ${srcdir}/mxu11x0/driver/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}