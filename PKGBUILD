# Maintainer: byrdltd <byrdltd@users.noreply.github.com>

pkgname=whydpi
pkgver=0.2.1
pkgrel=1
pkgdesc="Adaptive, per-SNI DPI bypass that learns optimal TLS fragmentation per host"
arch=('any')
url="https://github.com/byrdltd/whyDPI"
license=('MIT')
depends=(
  'python>=3.10'
  'iptables'
)
optdepends=(
  'systemd: run whydpi as a service at boot'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8bd39e0b59cd3eb2c3eecd4d777e1cad36c30726ce7ef59ce6e591cf8c08f0e8')

build() {
  cd "whyDPI-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "whyDPI-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 whydpi.service "${pkgdir}/usr/lib/systemd/system/whydpi.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
