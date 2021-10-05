# Maintainer: Ben Brooks <ben@bbrks.me>

# PRs/Issues: https://github.com/bbrks/aur-portainer-bin

pkgname=portainer-bin
pkgver=2.9.0
pkgrel=2
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
            '06ff058dd9d62c9fc9cc2a1ad9fe42d5ca8371ee27f24bdbec276b91539a3fae')
sha256sums_armv6h=('82205ed8a471edff296f28d4c28d799d982215ceed70023c4010febcb74a984b')
sha256sums_armv7h=('82205ed8a471edff296f28d4c28d799d982215ceed70023c4010febcb74a984b')
sha256sums_aarch64=('3817692f099350a59cf9b39c501de495897bea7a274d8a81a5f9c24e3476ec03')
sha256sums_x86_64=('f8dfae3f172dbe5efc92c37a5c0d01df98dabcdc60cc3970cc3045cb8d3b6ec7')

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
