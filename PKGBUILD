# Maintainer: Florian Wetzel <aur@commanderred.xyz>
pkgname=prometheus-adaptec-exporter

pkgver=1.0.1
commit="2cb1e244ea7319117e1de13e0054d0bc0ceb3d76"
pkgrel=1
pkgdesc="Prometheus Adaptec Exporter"

arch=('any')
url="https://github.com/CommanderRedYT/prometheus-adaptec-exporter"
license=('GPLv3')

depends=('python' 'python-prometheus_client')
makedepends=('python-build' 'python-installer')

source=(
  "https://github.com/CommanderRedYT/prometheus-adaptec-exporter/archive/${commit}.tar.gz"
)
sha256sums=(
  '2954d9e3b3061e258cf4786c4373621be65b05f87180f8e7993582b689373c0a'
)

build() {
  cd "$pkgname-$commit"

  python -m build
}

package() {
  cd "$pkgname-$commit"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D -m 644 "prometheus-adaptec-exporter.service" "${pkgdir}/usr/lib/systemd/system/prometheus-adaptec-exporter.service"
}
