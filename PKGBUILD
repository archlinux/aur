pkgname=fing
pkgver=5.5.2
pkgrel=1
pkgdesc='The ultimate tool for network discovery and scanning'
arch=('x86_64')
url='https://www.fing.com/images/uploads/general/Fing_CLI_User_Guide_1.2.pdf'
license=('custom:FING EXECUTABLE LICENSE')
depends=('icu55')
options=(!strip)
source=(https://www.fing.com/images/uploads/general/CLI_Linux_Generic_${pkgver}.zip)
sha1sums=('06ec64338577ab805f10ac817b5266ccbe8d0d29')

prepare() {
    tar -zxvf ${pkgname}-${pkgver}-amd64.tar.gz
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}-amd64
  cp -r usr ${pkgdir}/
  install -dm755 "${pkgdir}"/etc/${pkgname}
  install -Dm644 ./usr/local/share/${pkgname}/template/conf/*.properties "${pkgdir}"/etc/${pkgname}

  # license
  install -dm755 "${pkgdir}"/usr/local/share/licenses/${pkgname}
  ln -s /usr/local/share/${pkgname}/doc/license.txt "${pkgdir}"/usr/local/share/licenses/${pkgname}/license

  # cleanup
  rm -rf "${pkgdir}"/usr/local/lib/fing/init.d
  rm -rf "${pkgdir}"/usr/local/lib/fing/upstart
  rm -f  "${pkgdir}"/usr/bin/fing-uninstall.sh
}
