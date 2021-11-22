# Maintainer: Ben Brooks <ben@bbrks.me>

# PRs/Issues: https://github.com/bbrks/aur-portainer-bin

pkgname=portainer-bin
pkgver=2.9.3
pkgrel=1
epoch=
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

sha256sums=('08603677ac3c01235fcd740892bfae9277bd163b908f62b22e6e7edfdb61976c'
            '8cb50d80f1463cef0a907b7f26ec6387b792182959f51f8cd19dcb6f955b886e'
            '82f7fca2af76e52147397c3b7b07091b72c1be7c82da6bc47e53001306759635'
            '5b1247dcd060d654d0d2f6d61a43136eff98fc0b6176879f07dad2200e0da474')
sha256sums_armv6h=('a4982f235d88eee5650775dcc32a43062c2153391e791e1270cb9cfe3f080a7a')
sha256sums_armv7h=('a4982f235d88eee5650775dcc32a43062c2153391e791e1270cb9cfe3f080a7a')
sha256sums_aarch64=('b7f27d20468c8ee6a80cd001b81498b72588bc301ca911fafd3d269f71acb39e')
sha256sums_x86_64=('57a49dbaad7efb0c8cd2c78bfcd353e6dc10c18e04f08ba890f421c415ba8abc')

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
