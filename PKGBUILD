# Maintainer: envolution
# Contributor: Ben Brooks <ben@bbrks.me>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=portainer-lts-bin
pkgver=2.33.4
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
            '5b3f05b504964b31695a1264f500dab908cc00b239337bd6718e6a0d702c4023')
sha256sums_armv6h=('a2bd5206299f1d691b26ce75275bfbcdfdb65a5910fad73374deec0526412c7f')
sha256sums_armv7h=('a2bd5206299f1d691b26ce75275bfbcdfdb65a5910fad73374deec0526412c7f')
sha256sums_aarch64=('79fd91c4ce60851db44510ba0ae7af2237bb229c198fa0a62879f25b64b498a4')
sha256sums_x86_64=('96096f54714d27c0e8fd9cf43a840b89c2f219c1057fdbf751b50e663f7e0675')

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
