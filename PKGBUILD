# Maintainer: lcaohoanq <hoangclw@gmail.com>

pkgname=docklane-bin
pkgver=0.1.0_alpha.3
pkgrel=1
pkgdesc='Local HTTPS gateway for Docker containers using Traefik'
arch=('x86_64' 'aarch64')
url='https://github.com/lcaohoanq/docklane'
license=('Apache-2.0')
depends=('ca-certificates-utils' 'dnsmasq' 'docker' 'systemd')
provides=("docklane=${pkgver}")
conflicts=('docklane')
options=('!strip' '!debug')

_upstream_version='0.1.0-alpha.3'

source_x86_64=(
  "${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${_upstream_version}/docklane_${_upstream_version}_linux_amd64.tar.gz"
)
source_aarch64=(
  "${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${_upstream_version}/docklane_${_upstream_version}_linux_arm64.tar.gz"
)

sha256sums_x86_64=(
  'ff1fa95c99a2842f79bc933478724f0f19a1fcb8e2998d3507831fce09ffbcf7'
)
sha256sums_aarch64=(
  '2d614690ea176a944d48ea4701b5047e6856670f7317cc2faffa544bb32668a0'
)

package() {
  local release_arch

  case "$CARCH" in
    x86_64) release_arch=amd64 ;;
    aarch64) release_arch=arm64 ;;
  esac

  cd "${srcdir}/docklane_${_upstream_version}_linux_${release_arch}"

  install -Dm755 docklane "${pkgdir}/usr/bin/docklane"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
