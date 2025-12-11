# Maintainer: envolution
# Contributor: Ben Brooks <ben@bbrks.me>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=portainer-bin
pkgver=2.37.0
pkgrel=1
epoch=2
pkgdesc="A lightweight docker management UI (STS)"
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
            '9ede9744c63cccb382f5481e99cdcf6a2ad8112422526d7f93190cf30c50e66c')
sha256sums_armv6h=('c1ffc783f623f1e23e317856b0d927a33feccf0aa1de102edd40ba2887d44bb2')
sha256sums_armv7h=('c1ffc783f623f1e23e317856b0d927a33feccf0aa1de102edd40ba2887d44bb2')
sha256sums_aarch64=('2f491e0b98173553843981e354b806c92d0eeaacbd7df56867ce621082a6cc25')
sha256sums_x86_64=('c0d5c37968b62538caa737d9f83e6f62206ff89608c25bf2ed22998e17f50125')

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
