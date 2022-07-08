# Maintainer: Kevin Rauwolf <sweetpea-aur@tentacle.net>
pkgname=prometheus-statsd-exporter
pkgver=0.22.7
pkgrel=1
pkgdesc="StatsD to Prometheus metrics exporter"
arch=('x86_64')
url="https://github.com/prometheus/statsd_exporter"
license=('Apache')
depends=(glibc)
makedepends=(go-pie git)
checkdepends=(yamllint)
source=($pkgname-$pkgver.tar.gz::https://github.com/prometheus/statsd_exporter/archive/v${pkgver}.tar.gz prometheus-statsd-exporter.service)

check() {
  cd statsd_exporter-$pkgver
  make test
}

build() {
  cd statsd_exporter-$pkgver
  make build
}

package() {
  install -Dm644 prometheus-statsd-exporter.service "$pkgdir"/usr/lib/systemd/system/prometheus-statsd-exporter.service
  cd statsd_exporter-$pkgver
  install -Dm755 prometheus-statsd-exporter "$pkgdir"/usr/bin/prometheus-statsd-exporter
}
sha512sums=('1f68ad7af3fd5dccc738fc341b1422a2128f6dcc132d91a4c5f1181c38b96abb183686b247c67dacd4f3dd11a6deadc4f0926472e9015f7ed6263374eac38fe4'
            'a4ceb1291b358140082ac044c5c5f38dc24bdcb60e94fb2c3a41c5c01a7d8e4d40cac01b653e7f8c146b91db0348b2d350a7523144090a3e6c92c5f56975c171')
