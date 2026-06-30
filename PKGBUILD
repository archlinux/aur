# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=3.4.2
pkgrel=1
pkgdesc="Xray panel supporting multi-protocol multi-user expire day & traffic & IP limit"
arch=(aarch64 armv7h i686 x86_64)
url="https://github.com/MHSanaei/${pkgname%-bin}"
license=(GPL-3.0-only)
depends=(sh)
optdepends=(
  'acme.sh: Certificate Management'
  'fail2ban: IP Limit Management'
  'openldap: LDAP integration'
  'openssh: SSH Port Forwarding Management'
  'postgresql: recommended for high client counts or multi-node setups'
  'speedtest-cli: Speedtest by Ookla'
  'ufw: Firewall Management'
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
source_aarch64=($url/releases/download/v$pkgver/${pkgname:1:4}-linux-arm64.tar.gz)
source_armv7h=( $url/releases/download/v$pkgver/${pkgname:1:4}-linux-armv7.tar.gz)
source_i686=(   $url/releases/download/v$pkgver/${pkgname:1:4}-linux-386.tar.gz)
source_x86_64=( $url/releases/download/v$pkgver/${pkgname:1:4}-linux-amd64.tar.gz)
sha256sums_aarch64=('f7ce1303a22fa06a0d9de101a8b831c78ce756d84319ea1ff5236ce523e8ecd0')
sha256sums_armv7h=('507f681eb044d5277335a5dea4ade2daca2d5b4b6a8c12fb9cfb31187bb56320')
sha256sums_i686=('e11bfdf7e8e9e1883d0e041597624a0bedf075791456ba3e4d8da72d2ab4fff7')
sha256sums_x86_64=('1086716ea4b09f87893da3d83d5957af28ab7094c3a3a374cb3b369f6c0009a6')
b2sums_aarch64=('5f082637b77d1db4e64d663dbdec8adc340c12ce0c0adc9108573992e776b877467aa02c50301b8a69427a952706a5b81e9e68ff0f2e52724fdfc0cd9aa710c6')
b2sums_armv7h=('9967111e81ae8f5bc9161e48cd7ea73a743d7bd010a776ab65ccaec33611aeaa1fc2bbc46ed3846bf3f3450f104ec864d854b1212b2257ba206a16f4025ed3a2')
b2sums_i686=('4e930b429258e1a914e9d4570fc5d761fe2c83ae74f2399be02fa15f4bbfe42bcdde840fb4c494129bfb027f0b0547e4747704afd9915d57baa4d6acd47d73bb')
b2sums_x86_64=('3d64f66005e4d1d133dd2248184b55ad33017d67ebffe6140c614763d04677ca8b898fc119d16a2ed3886c975198684a19f6823ad79baac10cce725419b67bdc')

prepare() {
  cd ${pkgname:1:4}
  sed -i 's|:=/usr/local|:=/usr/lib|;s|:=/etc|:=/usr/lib|'                                   ${pkgname:1:4}.sh
  sed -i 's|&& legacy_version\( 0\)\?|\&\& echo "Please use AUR helper for this function"|g' ${pkgname:1:4}.sh
  sed -i 's|&& uninstall\( 0\)\?|\&\& echo "Please use AUR helper for this function"|g'      ${pkgname:1:4}.sh
  sed -i 's|&& update_menu|\&\& echo "Please use AUR helper for this function"|'             ${pkgname:1:4}.sh
  sed -i 's|&& update 0$|\&\& echo "Please use AUR helper for this function"|'               ${pkgname:1:4}.sh
  sed -i 's|&& update$|\&\& echo "Please use AUR helper for this function"|'                 ${pkgname:1:4}.sh
  sed -i 's|=/usr/local|=/usr/lib|'                                                          ${pkgname:1:4}.service.arch
}

package() {
  cd ${pkgname:1:4}
  install -vDm 755 ${pkgname:1:4}.sh                 "$pkgdir"/usr/bin/${pkgname:1:4}
  install -vDm 755 ${pkgname:1:4}                 -t "$pkgdir"/usr/lib/${pkgname:1:4}/
  install -vDm 755 bin/xray-linux-*               -t "$pkgdir"/usr/lib/${pkgname:1:4}/bin/
  install -vDm 755 bin/mtg-linux-*                -t "$pkgdir"/usr/lib/${pkgname:1:4}/bin/
  install -vDm 644 bin/geo{ip,site}{,_IR,_RU}.dat -t "$pkgdir"/usr/lib/${pkgname:1:4}/bin/
  install -vDm 644 ${pkgname:1:4}.service.arch       "$pkgdir"/usr/lib/systemd/system/${pkgname:1:4}.service
}
