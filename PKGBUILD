# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Created: 08/12/2010
# Maintainer: Salan54 <salan at fremenil dot com>
# Modified: 05/16/2013
pkgname=overlook-fing
pkgver=2.2
pkgrel=3
_altpkgname=fing
pkgdesc='The ultimate tool for network discovery and scanning'
arch=('i686' 'x86_64')
url='http://www.overlooksoft.com/'
license=('custom:Overlook Freeware license')
depends=('boost-libs' 'openssl' 'zlib')
options=(!strip)
case $CARCH in
  i686)
    source=("${pkgname}-${pkgver}.tgz::http://www.overlooksoft.com/packages/linux32/${pkgname}-${pkgver}.tgz"
    "fingbox-sentinel.service"
    "fingbox-sentinel.script"
    )
    md5sums=('fa523c841daa6963fda51a32b5972bcd' '013488a7afe3048524df6b7527faae69' '95dbef149b9d3a9ea3bac0bd0c77b343')
    ;;
  x86_64)
    source=("${pkgname}-${pkgver}.tgz::http://www.overlooksoft.com/packages/linux64/${pkgname}-${pkgver}.tgz"
    "fingbox-sentinel.service"
    "fingbox-sentinel.script"
    )
    md5sums=('3e599f665442631657ebc8bef74d98e1' '013488a7afe3048524df6b7527faae69' '95dbef149b9d3a9ea3bac0bd0c77b343')
   ;;
esac

package() {
  cd "$srcdir"
  cp -r usr $pkgdir/
  install -dm755 "${pkgdir}"/etc/${_altpkgname}
  install -dm755 "${pkgdir}"/var/data/${_altpkgname}/{box,sentinel}
  install -dm755 "${pkgdir}"/var/log/${_altpkgname}

  install -Dm644 ./usr/share/${_altpkgname}/template/conf/sentinel.txt "${pkgdir}"/var/data/${_altpkgname}/sentinel/
  install -Dm644 ./usr/share/${_altpkgname}/template/conf/*.properties "${pkgdir}"/etc/${_altpkgname}/

  # systemd & fingbox-sentinel
  install -Dm755 fingbox-sentinel.service "${pkgdir}"/usr/lib/systemd/system/fingbox-sentinel.service
  install -Dm755 fingbox-sentinel.script "${pkgdir}"/usr/lib/systemd/scripts/fingbox-sentinel

  # license
  install -dm755 "${pkgdir}"/usr/share/licenses/${_altpkgname}
  ln -s /usr/share/${_altpkgname}/doc/license.txt "${pkgdir}"/usr/share/licenses/${_altpkgname}/license
}

# vim:set ts=2 sw=2 et ft=sh tw=100:

