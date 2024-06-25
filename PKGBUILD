# Maintainer: Florian Wetzel <aur@commanderred.xyz>
pkgname=prometheus-tasmota-power-exporter
reponame=${pkgname#prometheus-}

pkgver=1.0.3
pkgrel=2
pkgdesc="Prometheus Tasmota Power Exporter"

arch=('any')
url="https://github.com/CommanderRedYT/tasmota-power-exporter"
license=('GPLv3')

depends=('python' 'python-prometheus_client' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools')

source=(
  "https://github.com/CommanderRedYT/tasmota-power-exporter/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('3933f9149fe49383d2217d29492f2584539691aaa2015527a6725e292b90d7e5')

build() {
  cd "$reponame-$pkgver"

  python -m build
}

# check() {
#   cd $_name-$pkgver
# 
#   python setup.py pytest
# }

package() {
  cd "$reponame-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D -m 644 "prometheus-tasmota-power-exporter.service" "${pkgdir}/usr/lib/systemd/system/prometheus-tasmota-power-exporter.service"
  install -D -m 644 "prometheus-tasmota-power-exporter.conf" "${pkgdir}/etc/conf.d/prometheus-tasmota-power-exporter"
  install -D -m 644 "prometheus-tasmota-power-exporter.sysusers" "${pkgdir}/usr/lib/sysusers.d/prometheus-tasmota-power-exporter.conf"
}
