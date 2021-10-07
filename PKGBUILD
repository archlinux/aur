# Maintainer: Kevin Rauwolf <sweetpea-aur@tentacle.net>
pkgname=prometheus-statsd-exporter
pkgver=0.22.2
pkgrel=2
pkgdesc="StatsD to Prometheus metrics exporter"
arch=('x86_64')
url="https://github.com/prometheus/statsd_exporter"
license=('Apache')
depends=(glibc)
makedepends=(go-pie git)
checkdepends=(yamllint)
source=($pkgname-$pkgver.tar.gz::https://github.com/prometheus/statsd_exporter/archive/v${pkgver}.tar.gz prometheus-statsd-exporter.service)
sha512sums=('ed60640c6b84e916d3bec224959a55c6890ee76651be16493ac9e5c25d6c7179b29fa17ef81d4cbda1aecbb75ec965cff2d21f8f30502e0de88827298bb6bf72'
            'a4ceb1291b358140082ac044c5c5f38dc24bdcb60e94fb2c3a41c5c01a7d8e4d40cac01b653e7f8c146b91db0348b2d350a7523144090a3e6c92c5f56975c171')

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
