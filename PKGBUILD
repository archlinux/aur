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
