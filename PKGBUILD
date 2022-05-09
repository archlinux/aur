# Maintainer: Ben Brooks <ben@bbrks.me>

# PRs/Issues: https://github.com/bbrks/aur-portainer-bin

pkgname=portainer-bin
pkgver=2.13.0
pkgrel=1
epoch=1
pkgdesc="A lightweight docker management UI"
arch=('armv6h' 'armv7h' 'aarch64' 'x86_64')
url="https://github.com/portainer/portainer"
license=('custom:zlib')
provides=('portainer')
conflicts=('portainer')
depends=('docker' 'docker-compose')
optdepends=()
makedepends=()

source=("portainer.service"
        "portainer.png"
        "portainer.desktop"
        "portainer-${pkgver}-src.tar.gz::${url}/archive/${pkgver}.tar.gz")
source_x86_64=("${url}/releases/download/${pkgver}/portainer-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/portainer-${pkgver}-linux-arm64.tar.gz")
source_armv6h=("${url}/releases/download/${pkgver}/portainer-${pkgver}-linux-arm.tar.gz")
source_armv7h=("${url}/releases/download/${pkgver}/portainer-${pkgver}-linux-arm.tar.gz")

sha256sums=('6084891b03f8985d087b0fce2240766e919ebf0b7f385c0a41b02176585cd270'
            '8cb50d80f1463cef0a907b7f26ec6387b792182959f51f8cd19dcb6f955b886e'
            '82f7fca2af76e52147397c3b7b07091b72c1be7c82da6bc47e53001306759635'
            '2bc57ad1a0d8137fb597f45dff0e5d93dae3ccf823f5c892ef65d5a910a77750')
sha256sums_armv6h=('e29b6a89b03db2d8931f439068b8f2bf85310ee6584873cba97d92443d1711ae')
sha256sums_armv7h=('e29b6a89b03db2d8931f439068b8f2bf85310ee6584873cba97d92443d1711ae')
sha256sums_aarch64=('4a22aae4bd21cbc2e3639cfc7522f6e4dfd860192d4c145668dee16c478e7264')
sha256sums_x86_64=('bb804521b03e25a44fc9e38ad3b337885993a9d566a708c0a2ae4d1871837071')

package() {
  install -Dm644 "${srcdir}/portainer-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/portainer/portainer" "${pkgdir}/usr/bin/portainer"

  mkdir -p "${pkgdir}/usr/share/portainer"
  cp -rip "${srcdir}/portainer/public" "${pkgdir}/usr/share/portainer/public"

  install -Dm644 "portainer.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/portainer.png"
  install -Dm644 "portainer.desktop" "${pkgdir}/usr/share/applications/portainer.desktop"
  install -Dm644 "portainer.service" "${pkgdir}/usr/lib/systemd/system/portainer.service"

  ln -s "/usr/bin/docker-compose" "${pkgdir}/usr/share/portainer/docker-compose"
}
