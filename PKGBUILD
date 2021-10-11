# Maintainer: Ben Brooks <ben@bbrks.me>

# PRs/Issues: https://github.com/bbrks/aur-portainer-bin

pkgname=portainer-bin
pkgver=2.9.1
pkgrel=1
epoch=
pkgdesc="A lightweight docker management UI"
arch=('armv6h' 'armv7h' 'aarch64' 'x86_64')
url="https://github.com/portainer/portainer"
license=('custom:zlib')
provides=('portainer')
conflicts=('portainer')
optdepends=('docker: local Docker support'
            'docker-compose: local Docker support')

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
            '5a190302d7ec2dba6d9640e4d152e803925890f395e6a2738d8b0b77f6db346b')
sha256sums_armv6h=('ef8b6a28c3bc4ac409f006845a380914e4fe7b2cd4a0d16f1f0c63f3a201171e')
sha256sums_armv7h=('ef8b6a28c3bc4ac409f006845a380914e4fe7b2cd4a0d16f1f0c63f3a201171e')
sha256sums_aarch64=('d99bacb266ad47cbba707eae38287ccc213a78501d50e46aef20571f01ad29e1')
sha256sums_x86_64=('927c0874c6ee9ac34055d530484757a276c25befe8cee5c18df1b15ee2cdefb2')

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
