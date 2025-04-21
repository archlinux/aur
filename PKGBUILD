# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=ifcplugin
pkgver=3.1.1.0
pkgrel=6
pkgdesc='Crypto Interface Web Browser Plugin for https://gosuslugi.ru/'
arch=('i686' 'x86_64')
url="https://ds-plugin.gosuslugi.ru/plugin/upload/Index.spr"
license=('unknown')
depends=('pcsc-tools' 'glibc' 'acsccid')
makedepends=('sed')
install='ifcplugin.install'

source_x86_64=("$pkgname-$pkgver.rpm::https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin-x86_64.rpm")
sha256sums_x86_64=("c91c5a52d3fb21a7bb43f97ed97a6fba489af1399fe88631e9b859642863bfee")
source_i686=("$pkgname-$pkgver.rpm::https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin-i386.rpm")
sha256sums_i686=("ca61dd6e477c0db3ba79e482448fe5267fe71fbf1841d43eb41e4f7cb78ed3dd")
source=('https://www.cryptopro.ru/sites/default/files/public/faq/ifcx64.cfg')
sha256sums=('cc1fa407b08c195bf8ad505446df191b8eb17f97d1b299ed36752ca6f91cc3a9')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}"
  cp -a "${srcdir}/opt" "${pkgdir}"
  cp -a "${srcdir}/etc" "${pkgdir}"
  rm -rf "${pkgdir}/usr/lib64"
  
  mkdir -p "${pkgdir}/var/log/ifc/engine_logs"
  chmod 777 -R "${pkgdir}/var/log/ifc"
  
  sed -i 's/ifd-ccid.bundle/ifd-acsccid.bundle/g' "${pkgdir}/etc/update_ccid_boundle/update_ccid_boundle.sh"
  iconv -f CP1251 -t UTF-8 "${srcdir}/ifcx64.cfg" -o "${pkgdir}/etc/ifc.cfg"
}

