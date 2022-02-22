# Maintainer: Laura Demkowicz-Duffy <laura@demkowiczduffy.co.uk>
pkgname=packer-plugin-arm-image
pkgver=0.2.5
pkgrel=1
pkgdesc="Packer plugin for ARM images"
url="https://github.com/solo-io/${pkgname}"
arch=('x86_64')
license=('APACHE')
depends=('glibc' 'multipath-tools' 'qemu-user-static' 'packer')
makedepends=('go')
replaces=('packer-builder-arm-image')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/solo-io/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('d9b75dd7ff310b0037d7b56c8df27e6eea53b91f10a7f1b90d21336aaa52448974302f1e8b58fbfbd3b8b37e7d5675c0fef31f65a40a11382de8426b75c25c03')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export "GOPATH=$(mktemp -d)"
  go generate ./...
  go build -o packer-plugin-arm-image .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
