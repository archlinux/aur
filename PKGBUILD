# Maintainer: Kevin Rauwolf <sweetpea-aur@tentacle.net>
pkgname=prometheus-statsd-exporter
pkgver=0.28.0
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
sha512sums=('f37067644e3d24d299c5d39f73f1671014e21a589633d9296d9655ba3902530ac193e5306bcf9a8e74aa0d1eaf3bea662e25678e18a7f28e34a2ec3ba879a040'
            'a4ceb1291b358140082ac044c5c5f38dc24bdcb60e94fb2c3a41c5c01a7d8e4d40cac01b653e7f8c146b91db0348b2d350a7523144090a3e6c92c5f56975c171')
