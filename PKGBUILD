# Maintainer: Kevin Rauwolf <sweetpea-aur@tentacle.net>
pkgname=prometheus-statsd-exporter
pkgver=0.27.2
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
sha512sums=('80aa34dec633c70578704fa22a4b42c5295280bdb1b9f99dffe9a13103d54f0c2c02dc280a9edec81807e8361a54273433109ad9dc5e523eefba0de7f62416e7'
            'a4ceb1291b358140082ac044c5c5f38dc24bdcb60e94fb2c3a41c5c01a7d8e4d40cac01b653e7f8c146b91db0348b2d350a7523144090a3e6c92c5f56975c171')
