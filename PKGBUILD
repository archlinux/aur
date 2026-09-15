# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=3.8.0
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
sha256sums_aarch64=('e93b7a6ba83bace11c5bf2192a15ae0eec24b1c02496567149fce0d223aba309')
sha256sums_armv7h=('4aea86058dc2b3ecd346bc41aeadc5ac63eca4f66e385162016f7296659924c3')
sha256sums_i686=('03e8c74e926bfd5f937b97e64d6fb55f86d022d637ebb40056dfcae27070111d')
sha256sums_x86_64=('236b837627520f0c4ae4134dc6a34ea5e294b69e158879795fe8cd51c5f3582c')
b2sums_aarch64=('de1358edd55dcb1da2fe8afd7688b6e99aaa80e1f18799d7c09f725e862be485968bfb7e723bddf556d2475a39b5c3e3acd1fcb8b24b9485afbcfd9c29585507')
b2sums_armv7h=('5fa56ba9ab4337af91fb3c2b2f5148fd1f3570430647c3def348ccc80ac6bef5b805918fe57eff7a3fa918c14da0ec8fd65a0b1c5c883040a09953bc8a22a11a')
b2sums_i686=('7145dcb1bea8643f3508d7d48d3822d1da954c2c277358ba594f13129396e610bdcc6c1c6aa48436d15fdce53afce3267a888b667add57ccd29257863382c43a')
b2sums_x86_64=('e7c6585e3da7ea5a8d5297604939d391ca062dc6e9cd35b6fb878d04f33612f532a48e291b5c7efe084dbc3f2b5524abd19577a880ffea83c78cbe0e9dbc2b3f')

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
