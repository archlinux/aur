# Maintainer: Florian Wetzel <aur@commanderred.xyz>
pkgname=prometheus-adaptec-exporter

pkgver=1.0.3
commit="48ca3b0d63da1ac4ffa7f25caf86047208dd935f"
pkgrel=2
pkgdesc="Prometheus Adaptec Exporter"

arch=('any')
url="https://github.com/CommanderRedYT/prometheus-adaptec-exporter"
license=('GPLv3')

depends=('python' 'python-prometheus_client')
makedepends=('python-build' 'python-installer' 'python-setuptools')

source=(
  "https://github.com/CommanderRedYT/prometheus-adaptec-exporter/archive/${commit}.tar.gz"
)
sha256sums=('afe30bfe86ffc0b4b6ccdf6373809412bafa737db887cc9982bad6bcd3b478c3')

build() {
  cd "$pkgname-$commit"

  python -m build
}

package() {
  cd "$pkgname-$commit"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D -m 644 "prometheus-adaptec-exporter.service" "${pkgdir}/usr/lib/systemd/system/prometheus-adaptec-exporter.service"
}
