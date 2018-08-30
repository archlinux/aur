# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Gilles Hamel <hamelg at laposte dot net>

pkgname=grafana-bin
_pkgname=grafana
pkgver="5.2.3"
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
source_x86_64=("https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-${pkgver}.linux-amd64.tar.gz")
source_armv7h=("https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-${pkgver}.linux-armv7.tar.gz")
source_aarch64=("https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-${pkgver}.linux-arm64.tar.gz")
sha256sums=('44ceb7aad648c8e46a65026109fc0327bc6e01ba7060d97d9e83a3e8ad65379c')
sha256sums_x86_64=('946b9b1c76c166eea60bee3b1c8a376300302c4373895212e73f4e7ef0cf1d25')
sha256sums_armv7h=('d26aac82976138ca078a1b138ad61242e7a2d3afe55c223c812aeb6085e493ea')
sha256sums_aarch64=('f52966ba33639f1ae7edf3f82d67a09b75f3a1a336ed6833e9b3fa503fcb8619')


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
