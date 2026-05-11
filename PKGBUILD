# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-bin
pkgver=3.0.1
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
sha256sums_aarch64=('c928263d5ade64deaeede23539ae1024d3ba186969848106effa99c17e8d8ede')
sha256sums_armv7h=('7df7952fc90a0cb0d596bd1b0f16bc8b5fac52f0d47a7f61193ecebced3a5d3a')
sha256sums_i686=('5fee35a983316e697a293a30377535c93d7aa77c5e9dc84be1dcdc627eaaac07')
sha256sums_x86_64=('89fae4f7eb723cadfac3f2fc852d5f94dd61973c3af758addcf1a09e01eb3aa5')
b2sums=('a6f4eba028beba4f94d78ce40080e531939f98c9fa265c7a27d6ea17777cb549cd65be0193e390850fc418457e204f478c36f87b66844cb0abc69c893192e970'
        'da9c55306c37438f79adfb550d1d0003f14c4d597b170e4424428fc07040391fd904d63f738c46ac92ba13d8c8577b3e4a74bfe119d0f7b914d3e7839c4a0336')
b2sums_aarch64=('76df9579da992c5a87ae0f961856b24e6a29f343834b319c2b558b06434fd530f4b87bc0317f55f1efe5d4f222af0cce0566457c02d55c58555ab6c53edb1bdd')
b2sums_armv7h=('be031775366404b15f388aed3c883be5169dfdfaff6106aeee5375aa09ec8c3fe55ae627c879ba80e7daf4b460ff2108ab37d85ec2f477668c3b943d08adf6a4')
b2sums_i686=('2de4a6289c03379c669171d7c90bfd3d2b2997374d88276c7c6f9d496da91accfb5bbe68963a9039e99aa0ad9c6974dbb8f3b59f91a174c2468324eaa00d3fa4')
b2sums_x86_64=('460cb0eebf633cd1627384bff5b74a4f9652632d12971a8a292d6e10730941731e9f65463348a67c9e88b31cc2d23be426a7a906c39a93fb4f36e81ea6e96d00')

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
