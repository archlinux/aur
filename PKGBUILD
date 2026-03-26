# Maintainer: Max <replace-with-contact@example.com>

pkgname=attackshark-battery-bridge
pkgver=1.1.0
pkgrel=1
pkgdesc="Bridge proprietary Attack Shark mouse battery reports into standard Linux battery interfaces"
arch=('x86_64')
url="https://github.com/maxboeer/attackshark-battery-bridge"
license=('MIT')
depends=('python' 'systemd')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
backup=('etc/attackshark-battery-bridge/config.toml')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ab62d2b32fcfd616337362234276cf6bb1eb399049ad08a64cb122ad5186d538')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "packaging/attackshark-battery-bridge.service.pkg" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "packaging/config.example.toml" \
    "${pkgdir}/etc/attackshark-battery-bridge/config.toml"
  install -Dm644 "README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "TECHNICAL.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/TECHNICAL.md"
  install -Dm644 "LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
