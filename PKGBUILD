# Maintainer: Ben Brooks <ben@bbrks.me>

# PRs/Issues: https://github.com/bbrks/aur-portainer-bin

pkgname=portainer-bin
pkgver=2.16.2
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
            '50f24900a304dfc9db5424a65c1325a44f569dbed4a0efad960f83bc7f8f3d70')
sha256sums_armv6h=('03d108a4e6ce44aa5af40a941df0969b1125d43a97a1d6a48a6ec24795b8f07e')
sha256sums_armv7h=('03d108a4e6ce44aa5af40a941df0969b1125d43a97a1d6a48a6ec24795b8f07e')
sha256sums_aarch64=('34295551063f165c0a18a7d5d74dd3ca3a31e6341ffadf94e7d7dcce1882bd65')
sha256sums_x86_64=('d2083b7ecdb0b9a9498557fbb49008d12d11733058fb8c039fa413a97432f878')

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
