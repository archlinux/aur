# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Gilles Hamel <hamelg at laposte dot net>

pkgname=grafana-bin
_pkgname=grafana
pkgver=5.3.1
pkgrel=2
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
sha256sums_x86_64=('5febfdef89fa0bcb2b190bdb62b0671d79f8e1afe3075f8cc7db50e28a9d6c8c')
sha256sums_armv7h=('a4533a7458066d93e6006a627fb41e56fb1883914377d8b99e7ae8c997abb1fe')
sha256sums_aarch64=('4270d9e431a3da29251fb156d8f1d900a7f6e35a63cf0ad6d51a20643895e34b')


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
