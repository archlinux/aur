# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=3.7.0
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
sha256sums_aarch64=('3caf1db1e8b10bb1fa1324c945522690bcf01c533ee75b377268f1c01a3ce896')
sha256sums_armv7h=('fc5cffd218cdb6da0c22c1ce9981ee91f269f657ea71463a1a1b5a9d930d7983')
sha256sums_i686=('fe5db2bf3acbf97654dce9ef8f9d36d1ad97e3ec0c137b441208a4d39a5bad0f')
sha256sums_x86_64=('0f8dd7baef3458f6591574e24814f322cf7f5e1e27f0a594683745e50be84ec5')
b2sums_aarch64=('6205b9a6ed3a115c354f172e85d2c96d6094cbe144cce20b6e192ba307a25787ed46df477f2502395146d38711aedc93bd390a46b708900b1a3437f5911580da')
b2sums_armv7h=('7dd53cc51e1e9df690f7276d079cff2084e45366f9931d91dc21eb722af3b15414b547639f0de65753bf6fced17f2fce71050141df4f62ab6e4c87682d16645d')
b2sums_i686=('5bead33e629930f2ffa4d0aaa7f88c444a4e3e010b58b5e01af921602cca467224fccba5a046af3c3df7a958d201ea9c122f6ea538374e97215d2e2ebce321f3')
b2sums_x86_64=('c8be66aa04ec326d134d0e492b11db9dd8cde466a880b426f013187634c3c1ba8274121e224d5c4c7856ea6c28371d455319e868845bb90c017f4a8196f98713')

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
