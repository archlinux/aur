# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=3.3.0
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
sha256sums_aarch64=('090a78d4ff58411ba9c61163ead315a663f70282775a8fcd9177a56608eba04b')
sha256sums_armv7h=('65cbba872c757fcf56e63af271d0fce62078a9bed8fc565f4bdbd700bc470baa')
sha256sums_i686=('bd43b9dcc5cb39d9ea3fa215029c6788ee7c748503fbc1011510583edf88b954')
sha256sums_x86_64=('a3890689d7a025cf79acd18420dc1a06202ed6314409441000fff40f00a6b3b9')
b2sums=('a6f4eba028beba4f94d78ce40080e531939f98c9fa265c7a27d6ea17777cb549cd65be0193e390850fc418457e204f478c36f87b66844cb0abc69c893192e970'
        'da9c55306c37438f79adfb550d1d0003f14c4d597b170e4424428fc07040391fd904d63f738c46ac92ba13d8c8577b3e4a74bfe119d0f7b914d3e7839c4a0336')
b2sums_aarch64=('d7b3ea27996b1f67acf77dc02de531c3e142436ca38169a84e80dc2678f55ca2c59d7c761743ee6d55e2f4307f74466bd97247bdd720060642c34294c3a16a87')
b2sums_armv7h=('02318dc428e364155e76660a0405c37f29a4c03a719e0d307378750249c40a142f93aa868c98cfc8bf9ceb5ff8493e1372eacc4b243731ca9bdea91d22f5c9d7')
b2sums_i686=('2d55db8888a343cdf290d179e1dd219fdca63f388cb7e8d818bbe9b6f4eb9f0d354146ea6d0401ed77ce812d2642616790e80a0aa756e57654e91dae34f46183')
b2sums_x86_64=('4b2ae45b8100ec40600982ef0ddd73347991e4b36c5683a483bd3953f843680de8788d9ed4701c4f48264bba57f007c924feecb417fb32dae718cb0d83cd5f00')

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
  install -vDm 755 ${pkgname:1:4}.sh                              "$pkgdir"/usr/bin/${pkgname:1:4}
  install -vDm 755 ${pkgname:1:4}                              -t "$pkgdir"/usr/lib/${pkgname:1:4}/
  install -vDm 755 bin/xray-linux-*                            -t "$pkgdir"/usr/lib/${pkgname:1:4}/bin/
  install -vDm 644 bin/geo{ip,site}{,_IR,_RU}.dat              -t "$pkgdir"/usr/lib/${pkgname:1:4}/bin/
  install -vDm 644 ${pkgname:1:4}.service.arch                    "$pkgdir"/usr/lib/systemd/system/${pkgname:1:4}.service
  install -vDm 644 ../${pkgname:1:4}-updategeo.{service,timer} -t "$pkgdir"/usr/lib/systemd/system/
}
