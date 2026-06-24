# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=3.4.0
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
sha256sums_aarch64=('2853e19538a370ae09ee628ab89794a8a9a40ac324ccbfc9e78317e6089e13a5')
sha256sums_armv7h=('652eb3d00bae12c4b9ccd64deea174feebf090479ce203879b9a8aae05bd1acd')
sha256sums_i686=('cd4cf9b385d4691483631ade3f7cbcef67e76a268e87ddf1d47e2a38e07c2ab2')
sha256sums_x86_64=('7708a89492d11c276991bb02d800edb6e44f9e3532fe78d1cbb97b90b0b7c879')
b2sums_aarch64=('ef6666b877558c7b9fc71bf7a3235aa909c16c36a9117b29906372aa95ca4779d3134b36681733151d6c992770a0892778d1f5cfdebc575d4757c7caad960c20')
b2sums_armv7h=('57c52ef734086323f2139c4ed83d171f6211043dfcf1ab3414b7e20b2cb061bcc809fcd8656bdf2ed8f8dd694c8f0673270ae7f5ff210f936ffac5e5d009df39')
b2sums_i686=('5584fed10433eca41ed12e56a31cfbb44c7302e69a501c1ac28a9a5d8571c5ff4f8e8ae0411d6d2d8c772b5efb7f5f3f5c6f7908309832e9bb1644d8c13b5c46')
b2sums_x86_64=('6ecc32032efb31a6ae5393834de5e86eaff8794f1fbbb2c81930f801b6a9a0db1953c310094f6ea437337f6e1552b06da830a92b50c32f3502609c2aa9e9d029')

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
