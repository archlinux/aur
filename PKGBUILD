# Maintainer: lcaohoanq <hoangclw@gmail.com>

pkgname=docklane-bin
pkgver=0.1.0_alpha.2
pkgrel=1
pkgdesc='Local HTTPS gateway for Docker containers using Traefik'
arch=('x86_64' 'aarch64')
url='https://github.com/lcaohoanq/docklane'
license=('Apache-2.0')
depends=('ca-certificates-utils' 'dnsmasq' 'docker' 'systemd')
provides=("docklane=${pkgver}")
conflicts=('docklane')
options=('!strip' '!debug')

_upstream_version='0.1.0-alpha.2'

source_x86_64=(
  "${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${_upstream_version}/docklane_${_upstream_version}_linux_amd64.tar.gz"
)
source_aarch64=(
  "${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${_upstream_version}/docklane_${_upstream_version}_linux_arm64.tar.gz"
)

sha256sums_x86_64=(
  'eae8062d2d3c24d55ebeb8520d19edb4f550b059413c6ac014138ac15dcc35a9'
)
sha256sums_aarch64=(
  '8465259efd1c4d035be05f86fd7c3b3d2ff48afed0f748ef5845c29bc672c53f'
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
