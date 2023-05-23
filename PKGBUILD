# Maintainer: Ben Brooks <ben@bbrks.me>

# PRs/Issues: https://github.com/bbrks/aur-portainer-bin

pkgname=portainer-bin
pkgver=2.18.3
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
            'b7b82ffb11e2a004632f2ac9c5081a62c4a0ea172773f02cd3689f1b8180b4b6')
sha256sums_armv6h=('72c0244f3870641ff654cf98d2904692212cd68e742b4847af44998847ec23cb')
sha256sums_armv7h=('72c0244f3870641ff654cf98d2904692212cd68e742b4847af44998847ec23cb')
sha256sums_aarch64=('1e3254184685cf835236ed38e927152706a13b90a6206fa7407c1932f20b3a8f')
sha256sums_x86_64=('fddbb331f9c47dad69131fb177f1b89671f56a4a807161f3d35f85d7155bc765')

package() {
  install -Dm644 "${srcdir}/portainer-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/portainer/portainer" "${pkgdir}/usr/bin/portainer"

  mkdir -p "${pkgdir}/usr/share/portainer"
  cp -rip "${srcdir}/portainer/public" "${pkgdir}/usr/share/portainer/public"

  install -Dm644 "portainer.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/portainer.png"
  install -Dm644 "portainer.desktop" "${pkgdir}/usr/share/applications/portainer.desktop"
  install -Dm644 "portainer.service" "${pkgdir}/usr/lib/systemd/system/portainer.service"

  ln -s "/usr/lib/docker/cli-plugins/docker-compose" "${pkgdir}/usr/share/portainer/docker-compose"
  ln -s "/usr/bin/docker" "${pkgdir}/usr/share/portainer/docker"
}
