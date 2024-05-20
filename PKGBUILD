# Maintainer: Florian Wetzel <aur@commanderred.xyz>
pkgname=prometheus-adaptec-exporter

pkgver=1.0.2
commit="c1015b1cf04a57648a06a1e05e17fcbca5202d94"
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
  'ea129eba251a8f6a5fc29fa55c47c7f11a9eceff98f0dcd3dc56ac2644cf9671'
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
