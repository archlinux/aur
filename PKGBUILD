# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Gilles Hamel <hamelg at laposte dot net>
# Contributor: Erikas Rudinskas <erikmnkl@gmail.com>


pkgname=grafana-bin
_pkgname=grafana
pkgver=6.7.0
pkgrel=1
pkgdesc="A general purpose dashboard and graph composer. It supports graphite, influxdb or opentsdb - binary version"
url="http://grafana.org"
conflicts=('grafana')
provides=('grafana')
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('Apache')
install=${_pkgname}.install
backup=("etc/${_pkgname}/${_pkgname}.ini")
source=("grafana.service")
source_x86_64=("https://dl.grafana.com/oss/release/grafana-${pkgver}.linux-amd64.tar.gz")
source_armv6h=("https://dl.grafana.com/oss/release/grafana-${pkgver}.linux-armv6.tar.gz")
source_armv7h=("https://dl.grafana.com/oss/release/grafana-${pkgver}.linux-armv7.tar.gz")
source_aarch64=("https://dl.grafana.com/oss/release/grafana-${pkgver}.linux-arm64.tar.gz")
sha256sums=('07512df687b1cf622c1a71b67f3cdf286ba02d7b87a844a4c51f89e0228074f2')
sha256sums_x86_64=('0dc1193e568636af2c1354786f1ccd7c4c401b0124d4d980c184d50da8a6e615')
sha256sums_armv6h=('1d49cf7c6739fcab8e8d7e9f5c1158954bb1f630e50e429c70e78ac66c08354a')
sha256sums_armv7h=('10e439c2132643d5244de4b93829613b2911952a3f3296dca4b75e8094663144')
sha256sums_aarch64=('3d0cbd64ff42a384d59253c747a6e31d6ac4d836d8a1c41a16efa8f2e1c328b1')


package() {
  install -Dm644 "${srcdir}/grafana.service" "$pkgdir/usr/lib/systemd/system/grafana.service"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -dm755 "${pkgdir}/var/lib/grafana"
  install -dm755 "${pkgdir}/var/log/grafana"
  install -Dm755 bin/grafana-server "$pkgdir/usr/bin/grafana-server"
  install -Dm755 bin/grafana-cli "$pkgdir/usr/bin/grafana-cli"
  sed -i '/^;data = /c\data = /var/lib/grafana' conf/sample.ini
  sed -i '/^;logs = /c\logs = /var/log/grafana' conf/sample.ini
  install -Dm644 conf/sample.ini "$pkgdir/etc/${_pkgname}/${_pkgname}.ini"
  install -Dm644 conf/defaults.ini "$pkgdir/usr/share/grafana/conf/defaults.ini"
  cp -r public scripts tools "$pkgdir/usr/share/grafana/"
}
