# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Created: 08/12/2010
# Maintainer: Salan54 <salan at fremenil dot com>
# Modified: 04/15/2017

pkgname=overlook-fing
pkgver=3.0
pkgrel=3
_altpkgname=fing
pkgdesc='The ultimate tool for network discovery and scanning'
arch=('i686' 'x86_64')
url='https://www.fing.io/'
license=('custom:Overlook Freeware license')
depends=('boost-libs' 'openssl' 'zlib')
options=(!strip)

source_i686=("${pkgname}-${arch}-${pkgver}.tgz.zip::https://www.fing.io/wp-content/uploads/2016/09/overlook-fing-3.0.tgz_-1.zip"
    "fingbox-sentinel.service"
    "fingbox-sentinel.script"
    )
md5sums_i686=('a2ca3526282c05a9de2663313b9d6a7e' '013488a7afe3048524df6b7527faae69' '95dbef149b9d3a9ea3bac0bd0c77b343')

source_x86_64=("${pkgname}-${arch}-${pkgver}.tgz.zip::https://www.fing.io/wp-content/uploads/2016/09/overlook-fing-3.0.tgz_.zip"
    "fingbox-sentinel.service"
    "fingbox-sentinel.script"
    )
md5sums_x86_64=('903da68a597386614ec3f7416c0a00a4' '013488a7afe3048524df6b7527faae69' '95dbef149b9d3a9ea3bac0bd0c77b343')

prepare() {
    tar -zxvf overlook-fing-3.0.tgz
}

package() {
  cd "$srcdir"
  cp -r usr $pkgdir/
  install -dm755 "${pkgdir}"/etc/${_altpkgname}
  install -dm755 "${pkgdir}"/var/data/${_altpkgname}/{box,sentinel}
  install -dm755 "${pkgdir}"/var/log/${_altpkgname}

  install -Dm644 ./usr/local/share/${_altpkgname}/template/conf/sentinel.txt "${pkgdir}"/var/data/${_altpkgname}/sentinel/
  install -Dm644 ./usr/local/share/${_altpkgname}/template/conf/*.properties "${pkgdir}"/etc/${_altpkgname}/

  # systemd & fingbox-sentinel
  install -Dm755 fingbox-sentinel.service "${pkgdir}"/usr/local/lib/systemd/system/fingbox-sentinel.service
  install -Dm755 fingbox-sentinel.script "${pkgdir}"/usr/local/lib/systemd/scripts/fingbox-sentinel

  # license
  install -dm755 "${pkgdir}"/usr/local/share/licenses/${_altpkgname}
  ln -s /usr/local/share/${_altpkgname}/doc/license.txt "${pkgdir}"/usr/local/share/licenses/${_altpkgname}/license
}

# vim:set ts=2 sw=2 et ft=sh tw=100:
