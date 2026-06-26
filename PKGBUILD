# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=3.4.1
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
sha256sums_aarch64=('839bb7ed465da58a499e428ec16ac18baa3d8a9566b84d2b5eb4dcf8251c066a')
sha256sums_armv7h=('8b0077a708c47856761e253aa947806de9fc96ac24bb758fc056f52751ebd523')
sha256sums_i686=('4317628484265082ecc49da80e6caf45a2cb0f197105065237f283dde7713199')
sha256sums_x86_64=('b070589cbc71788628086c35fd123905cb2158f4fc07223c728a18a2a5908551')
b2sums_aarch64=('47fa29035c1a8ea398cb5cc9384ef18a64fe2d47472ac31197f0f624443f2290257b728000cc5b5a549bff2d0b18b50118b1b0a1d24ffa804564b2938bd49186')
b2sums_armv7h=('2c0a58e53f987ce7264e1a50aa0e46a36df6a1a6bd0c468c9935ea88bbe552e6f8401daa951b2e04c683031e987d49215d0465866b4d6a4260b657d2e542ebe2')
b2sums_i686=('c3b26af9175a68323cb321b7aebefc53af751248434c18c143ae7466405d60bdb3a7fa59a8234fa5d65bdc6b9a62afbedbf77c696a7ff09bc7dd1f79ca4ba175')
b2sums_x86_64=('d401ffe3f46e16d825821b48a261d7acd1e874dcdb91bcfc9eb2d6c8c35a1744ee3538ecbbb00a8bde4290d26d2709af761a3eb4a91304a50b363244bb62c685')

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
