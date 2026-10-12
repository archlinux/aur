# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=3.10.0
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
sha256sums_aarch64=('a0bb393989b96833c84460dff21c968a6263f4e09b7ceff93e0f92975aeadc16')
sha256sums_armv7h=('f6d331215584c788f77943d7a5a9301d22a64d41f0bf8fac74956a550839a2ab')
sha256sums_i686=('514f7376806ed30b3b8166f36256b47e6101994ccb2e3eebd07f408ce542903b')
sha256sums_x86_64=('b647a3e7d6695600bdd18cbfd34959991be09d4b1ad1e05efa790c0cf69ca40d')
b2sums_aarch64=('b1d5ecf4c69ffa49836f0395eca02861db05eea2f9a32a18b3925337b735e731246c2c1cf1f951d7c3ef697d95b078e7d6ab56fa7ec0c093cab30580cdcc0726')
b2sums_armv7h=('92ce209690395b109ae29be4a91e91bf850434f855470d4a26a1b82a1c2f5480a0c92ab6f0c12304909f46ca11eca70f3cc308d6516acd65ba2d1a84e30f10ca')
b2sums_i686=('4efcac083e7a534db34b6466728a68e028e983ccc92615e874ee37d3130c33b27e556ab0d48057f6fe3a78d899be285d852524fde5bc8270840412e782151c17')
b2sums_x86_64=('35eb61749395596b86eb2cf2fc7b37d4806dd16f92f33dffe1b4b604e165a3ad8ff2de3324193108b6bf7a0d8e24d24ec67ecddfccb73ac37fbe60ef06db7bce')

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
