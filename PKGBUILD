# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=3.5.0
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
sha256sums_aarch64=('0205f7d0ffbb8f3deae3b45c047f08622b6ec7d9ac670a880e0ae77bdadb7514')
sha256sums_armv7h=('e8db8b64f4fcb872e06e01264e3efcc6aaac188cdfe9ed4ee674d04c313de266')
sha256sums_i686=('327644f819d88df1260b12031e19473968cbc56f5bf9947074dd78b117dc4113')
sha256sums_x86_64=('684cde5996098dc9384878faa99ac13b341883ec79b81948b1900e29511ee498')
b2sums_aarch64=('aae1730ce7b069058f77c43104b5b5b1ef6786fd1012c5b4fa80698f0f52cc3e7109eeb90939d9d5447b5db4d8fdac8bffb6a112b4e46e181b52a366bf39afa2')
b2sums_armv7h=('b0ff3c70bace0c952eaa1919840885868973b7b976c3a426081fca2a9927745e6f243e125c45c6bffd23bfca6f004028e3612e8e45078d26e1bfd95cb52e681b')
b2sums_i686=('1d420b456f6746385f968f86cc3e8bb7897c88187609659969ac72a441d66416f902e08ee87654c3cc23e3ac49b477c12fd5b408addeaaf1847d1b335e335211')
b2sums_x86_64=('f346c583c9410d980f5dc18a7e1945b1923a4ea2158c0657cb3dc12526f2a7ff51f6c9265c91e6de602c3885a9833d5c8f6ba390265e74f939bf16a688e7a1c7')

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
