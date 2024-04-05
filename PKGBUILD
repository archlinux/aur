# Maintainer: Florian Wetzel <aur@commanderred.xyz>
pkgname=python-smart-prom-next
_name=${pkgname#python-}

pkgver=0.0.8
pkgrel=1
pkgdesc="S.M.A.R.T. Prometheus Metrics Exporter"

arch=('any')
url="https://github.com/PhilipMay/smart-prom-next"
license=('MIT')

depends=('python' 'python-prometheus_client' 'smartmontools')
makedepends=('python-setuptools')
# checkdepends=('python-pytest')

source=(
  "https://github.com/PhilipMay/smart-prom-next/archive/refs/tags/${pkgver}.tar.gz"
  "smart-prom-next.service"
)
sha256sums=(
  'cdc9c050f543e5a325a3c5b76021eb0f1b18798d7ffa6aa06c3addf1eb82a920'
  '7f5b48120d8a8520a6dbd476cad1a1eb7bff1cbe9175e7faf1627fd4a317a4af'
)

build() {
  cd "$_name-$pkgver"

  python setup.py build
}

# check() {
#   cd $_name-$pkgver
# 
#   python setup.py pytest
# }

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -D -m 644 "${srcdir}/smart-prom-next.service" "${pkgdir}/usr/lib/systemd/system/smart-prom-next.service"
}
