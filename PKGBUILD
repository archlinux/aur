# Maintainer: Ben Brooks <ben@bbrks.me>

# PRs/Issues: https://github.com/bbrks/aur-portainer-bin

pkgname=portainer-bin
pkgver=2.14.2
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
            '14b0ddf41afa4e472e59cab491148c7ddabfef005235f364efccbd7440b22600')
sha256sums_armv6h=('d195c25e8508af273b2fa3244d746820b170fbf30384567ebc81994d8d36a6c9')
sha256sums_armv7h=('d195c25e8508af273b2fa3244d746820b170fbf30384567ebc81994d8d36a6c9')
sha256sums_aarch64=('11b42017324d205233ba977dcdaec7946aa5ecc547e58262e8bf47d639d8c7a9')
sha256sums_x86_64=('b4e6675e8ca409326d4fe72862b7a0c3420681eec3cb03a6dddc83c7875df393')

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
