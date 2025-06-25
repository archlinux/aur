# Maintainer: envolution
# Contributor: Ben Brooks <ben@bbrks.me>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=portainer-lts-bin
pkgver=2.27.8
pkgrel=1
pkgdesc="A lightweight docker management UI (LTS)"
arch=('armv6h' 'armv7h' 'aarch64' 'x86_64')
url="https://github.com/portainer/portainer"
license=(Zlib)
provides=("portainer=$pkgver")
conflicts=(portainer)
depends=(docker docker-compose)

source=("portainer.service"
  "portainer.png"
  "portainer.desktop"
  "portainer-${pkgver}-src.tar.gz::${url}/archive/${pkgver}.tar.gz")
source_x86_64=("${url}/releases/download/${pkgver}/portainer-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/portainer-${pkgver}-linux-arm64.tar.gz")
source_armv6h=("${url}/releases/download/${pkgver}/portainer-${pkgver}-linux-arm.tar.gz")
source_armv7h=("${url}/releases/download/${pkgver}/portainer-${pkgver}-linux-arm.tar.gz")

sha256sums=('37274c8bc36ec81eae0307b9c58f1c09b34680fe7cb3cb330f253cbb4f8e704b'
            '8cb50d80f1463cef0a907b7f26ec6387b792182959f51f8cd19dcb6f955b886e'
            '82f7fca2af76e52147397c3b7b07091b72c1be7c82da6bc47e53001306759635'
            '619c85d038ad885e4809cc74414ebf78775239678c8d77f9bfa271a0c8bf636b')
sha256sums_armv6h=('385dde008d59bc57b9fb5d7d6b4954d4881a47a5f00895228c7c012582f0ddf6')
sha256sums_armv7h=('385dde008d59bc57b9fb5d7d6b4954d4881a47a5f00895228c7c012582f0ddf6')
sha256sums_aarch64=('e482155b2056e2f3625c3d25c8f5223da28991e66a6001ee7b5e36f83c6e980e')
sha256sums_x86_64=('9125e7e502b3a5d6632174d7e37840dcc661249e5729e5344e6c78f3ee6547c8')

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
# vim:set ts=2 sw=2 et:
