# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=3.0.0
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
source=(${pkgname:1:4}-updategeo.{service,timer})
sha256sums=('c42b96797b2e4236fed727f7e75e3768c76cbfeef6aba3716fe0bfc519fc7034'
            '79ad2215d3eecc452577ce98fbaf8e8968f3e95df8b32da657c9decc5534fdfb')
sha256sums_aarch64=('ae763ebc85a42263ef509992dad4c4a0fdbf64612893beedf2a1861efdb5e1e8')
sha256sums_armv7h=('30a2593e7ceb9f4f1c490f130fd08c75d65e46935e2c019a5b7486cd403cc0fb')
sha256sums_i686=('e609f817ce6593bfbe51d7e5420608b6994093d3d20d9bdebd9c0328880a3866')
sha256sums_x86_64=('ee758c5dcaf5ba6c58793cbabcf1859aea7f99bfa53e8698b0506f2d936d6512')
b2sums=('a6f4eba028beba4f94d78ce40080e531939f98c9fa265c7a27d6ea17777cb549cd65be0193e390850fc418457e204f478c36f87b66844cb0abc69c893192e970'
        'da9c55306c37438f79adfb550d1d0003f14c4d597b170e4424428fc07040391fd904d63f738c46ac92ba13d8c8577b3e4a74bfe119d0f7b914d3e7839c4a0336')
b2sums_aarch64=('035fc01e3c1f18c9680d3ca52039557e8b085edd68fb84fe97807e356d24742dbe0880df1b5dcc6f422238e3134bacd373e60f232ab3b0e59f06efc1a356e762')
b2sums_armv7h=('a6e5f275aff3c8273a63e4bc1f7861432a66dab27153066719bbfc4bcbe25a9593aac6f3b33378b97d43108d3bdcc0a35480078f3ce32791b34a5d5151448faa')
b2sums_i686=('f17fea4d7b164e9fe413beb8f214238214e531f37b9a988716e1d00f9c3f408ba40f4e3ab46f91badb5e1e5c454f78679b8046cf77645236c2bf6a8bcb2aa98b')
b2sums_x86_64=('37106e33a66dcd0228687a76fb03b540192fba906aa72c850e4133061b8d71b90ae1d2d66ceed65f13a6e4559969ff7523b0869962f6d9203c69c77151c21e04')

prepare() {
  cd ${pkgname:1:4}
  sed -i 's|:=/usr/local|:=/usr/lib|;s|:=/etc|:=/usr/lib|'                                   ${pkgname:1:4}.sh
  sed -i 's|&& legacy_version\( 0\)\?|\&\& echo "Please use AUR helper for this function"|g' ${pkgname:1:4}.sh
  sed -i 's|&& uninstall\( 0\)\?|\&\& echo "Please use AUR helper for this function"|g'      ${pkgname:1:4}.sh
  sed -i 's|&& update_menu|\&\& echo "Please use AUR helper for this function"|'             ${pkgname:1:4}.sh
  sed -i 's|&& update 0$|\&\& echo "Please use AUR helper for this function"|'               ${pkgname:1:4}.sh
  sed -i 's|&& update$|\&\& echo "Please use AUR helper for this function"|'                 ${pkgname:1:4}.sh
}

package() {
  cd ${pkgname:1:4}
  install -vDm 755 ${pkgname:1:4}.sh                              "$pkgdir"/usr/bin/${pkgname:1:4}
  install -vDm 755 ${pkgname:1:4}                              -t "$pkgdir"/usr/lib/${pkgname:1:4}/
  install -vDm 755 bin/xray-linux-*                            -t "$pkgdir"/usr/lib/${pkgname:1:4}/bin/
  install -vDm 644 bin/geo{ip,site}{,_IR,_RU}.dat              -t "$pkgdir"/usr/lib/${pkgname:1:4}/bin/
  install -vDm 644 ${pkgname:1:4}.service.arch                    "$pkgdir"/usr/lib/systemd/system/${pkgname:1:4}.service
  install -vDm 644 ../${pkgname:1:4}-updategeo.{service,timer} -t "$pkgdir"/usr/lib/systemd/system/
}
