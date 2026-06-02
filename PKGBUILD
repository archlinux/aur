# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=3.2.5
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
sha256sums_aarch64=('3744b91c8a3f2aa55916e71a4722fd6c62720aa00ff66859bda55d5cac4e8b13')
sha256sums_armv7h=('c20e685485d730fb86a46a789efce9016cba27ff1914e90fde9d8ab8decfae69')
sha256sums_i686=('da192bc1e35a7d988eec0c1af45f849b05e317d789397de0ee953bf677e3938d')
sha256sums_x86_64=('fb130c4372d753349161f5f5bf7d10e3c87e566cce5a36bc99845eee928b1070')
b2sums=('a6f4eba028beba4f94d78ce40080e531939f98c9fa265c7a27d6ea17777cb549cd65be0193e390850fc418457e204f478c36f87b66844cb0abc69c893192e970'
        'da9c55306c37438f79adfb550d1d0003f14c4d597b170e4424428fc07040391fd904d63f738c46ac92ba13d8c8577b3e4a74bfe119d0f7b914d3e7839c4a0336')
b2sums_aarch64=('d9e384afd85cce0c819d1b609fd9779c511f87ceb2d7a3e1be899ed81664005610fab0d0fbfbd9f2cafaf807daaad0cbbf6d3b2a4efbd46e5a9ff3b43e47c098')
b2sums_armv7h=('67ecc0bf253ad0745fac430ac4ecaad1b8b0ba7233bcdc2e209287a5e9b774aa69d2d083dfd739bdf98343b789b89498d47429826b59cf2c13a43a59cf5d16b1')
b2sums_i686=('b2c8f0c2904ec6b5fe3b39bd97956460c6eefab18238af82d5ced387b222e6818dec0e1d3f37adfaa1adb38f178ade4a4b704997f5aec8683e3489f8d26b242e')
b2sums_x86_64=('5e719c8e8b98df7c8bb69b17ac491a09db7cf4c0a21ce636f2ebc8e121224f08d1e1e35bad981cfeb6ebf931c83dd4dc4cc66c7e760aa66c41b69919e22c905c')

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
