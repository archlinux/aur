# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=3.6.0
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
sha256sums_aarch64=('3c244f547e394f6af3a9daae56ae796ab0b53ffe022770a4ab2395b98ada6247')
sha256sums_armv7h=('f72296cf3e7facc2b216f0d2809ac3b94c54002649092642abdfa7026d16748c')
sha256sums_i686=('23dce3a5704ca563f4dcecd08dd4422a346a042ee6000fb7ccac7184e4a2015b')
sha256sums_x86_64=('3c6b72f216ca6acc6c0b99b1f90b629579a483824b6cf744b23aeba28ebf3bd3')
b2sums_aarch64=('ee38c7602c8f6695101669af7d9b914471b5d06e66831bc487ea9ec30ec6ff38965a39a519e6e0f27d3907d2009cb85ab1da12c33ff5cb54ec8d3631f3e54186')
b2sums_armv7h=('3471a8feea2bc5dbf34fbc7dbac7d0240ebc8e103e154e18da5a744bc2b2e9a40872b7de53d7cc376aa8a11fa7d79cb0d3b62bd08dffd570a22d916373147d39')
b2sums_i686=('3d48f15f15714af8b0060f7e618a2357cb44870fb182477e4ceeb070db11347b3e2f8e1e8f6d878dd064e0838d8aefd79fa95c3a1842837413710316008d9a9b')
b2sums_x86_64=('42340dbc72831c41381120739b783b875fe5220ba4ed3b9742e54e7d9b3b5d8ec0725d839a3d14ceae3a600810617cfaee167d015687b44b8d7aa6b178a98108')

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
