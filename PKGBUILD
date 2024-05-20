# Maintainer: Florian Wetzel <aur@commanderred.xyz>
pkgname=prometheus-adaptec-exporter

pkgver=1.0.0
commit="acb8d139dcbe2b67615b99ce5d7e8bd59bb5a8df"
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
  'ff13749be733357ed5ab2731eb600d689a0cb722f421e27a93f364fc3b2994a0'
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
