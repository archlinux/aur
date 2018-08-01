# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Gilles Hamel <hamelg at laposte dot net>

pkgname=grafana-bin
_pkgname=grafana
pkgver="5.2.2"
pkgrel=1
pkgdesc="A general purpose dashboard and graph composer. It supports graphite, influxdb or opentsdb - binary version"
url="http://grafana.org"
conflicts=('grafana')
provides=('grafana')
arch=('x86_64' 'armv7h' 'aarch64')
license=('Apache')
install=${_pkgname}.install
backup=("etc/${_pkgname}/${_pkgname}.ini")
source=("grafana.service")
source_x86_64=("https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-${pkgver}.linux-x64.tar.gz")
source_armv7h=("https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-${pkgver}.linux-armv7.tar.gz")
source_aarch64=("https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-${pkgver}.linux-arm64.tar.gz")
sha256sums=('44ceb7aad648c8e46a65026109fc0327bc6e01ba7060d97d9e83a3e8ad65379c')
sha256sums_x86_64=('b5e2ac337ad08e692a3a59b46bc4adc8fe12d4982631137334558bd3f748eb37')
sha256sums_armv7h=('b3a1979be2c9bfea43797bbf62745afc60e8f6b5eb1fb58c634b08b8507ab935')
sha256sums_aarch64=('8a6261d50bd0f8ffd534a2f0c82fe143cb1dc1d6d0ec786a5d8c0250a9adcc50')


package() {
  install -Dm644 "${srcdir}/grafana.service" "$pkgdir/usr/lib/systemd/system/grafana.service"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -dm755 "${pkgdir}/var/lib/grafana"
  install -dm755 "${pkgdir}/var/log/grafana"
  install -Dm755 bin/grafana-server "$pkgdir/usr/bin/grafana-server"
  install -Dm755 bin/grafana-cli "$pkgdir/usr/bin/grafana-cli"
  install -Dm644 conf/sample.ini "$pkgdir/etc/${_pkgname}/${_pkgname}.ini"
  install -Dm644 conf/defaults.ini "$pkgdir/usr/share/grafana/conf/defaults.ini"
  cp -r public scripts tools "$pkgdir/usr/share/grafana/"
}
