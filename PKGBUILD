# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=3.2.7
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
sha256sums_aarch64=('471f2bb241d891c605154395cb3b9134a77b18cc722f037285fe539fce084f22')
sha256sums_armv7h=('153f5f097883677fe8877712818ba5d5ad4aa306edb4c3c19f364b0817c6600e')
sha256sums_i686=('1c7dfffb738e6169f646447b91f6307b98b1811e27954919f18a518fcf7076f5')
sha256sums_x86_64=('a346f2755577b96c2f05fd27738538e37a4602111e15da306d586f62dd8771da')
b2sums=('a6f4eba028beba4f94d78ce40080e531939f98c9fa265c7a27d6ea17777cb549cd65be0193e390850fc418457e204f478c36f87b66844cb0abc69c893192e970'
        'da9c55306c37438f79adfb550d1d0003f14c4d597b170e4424428fc07040391fd904d63f738c46ac92ba13d8c8577b3e4a74bfe119d0f7b914d3e7839c4a0336')
b2sums_aarch64=('36876137d548c0639d2041019a18fe1b3c01e6b4e2bac5ba2a63ea8be664b8a708baa3646806024124a41647e1f47a70f4956c4166a3ce29947e7a988bb2ff66')
b2sums_armv7h=('77e343427e5476f9e20afe7ca62e2cbb9c3efd5a2e30b4107ea62b9717ef6b6180e2dc646324d7bde9c6d9bac0f9fe8916a7b6080d0d62ee07ea1c140e36e204')
b2sums_i686=('f90d3db7d36d25aae1b3f5045fee977d8b118e378565fe796b30c94dfcc93c6acb50035b04bfee8d56094079f4cb4cdc027b2facffe4c84dda753478d5e6a68f')
b2sums_x86_64=('0d6c46e61a36ab58b87223c8cc03284c0fa4f0ef372cd354215ef4a0b4625af1f60dbe04c62d49642585a07b7f9b6cf04f8bd094cd58c42bc04fb73f04ef84a1')

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
