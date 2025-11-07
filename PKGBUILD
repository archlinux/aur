# Maintainer: Alexander Beck <dev@daallexx.eu>

_pkgname="etr"
pkgname="${_pkgname}-bin"
pkgver=0.0.4
pkgrel=1
pkgdesc='ETR - ECMP Traceroute'
arch=('aarch64' 'x86_64')
url='https://github.com/tkjaer/etr'
license=('MIT')
depends=('libpcap')
makedepends=('patchelf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=etr.install
source_aarch64=("${_pkgname}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")
source_x86_64=("${_pkgname}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")

sha256sums_aarch64=('c58a42b7f29a5d8c444b9329f294967c141cc20c4ed3b7499d991ab5abd8d1a1')
sha256sums_x86_64=('cf4b0e170963a181488a20adfb76bafad5a65262dec015faec8d5cc26c1f42f7')

options=(!debug)

build() {
  echo "${srcdir}/${_pkgname}"
  patchelf --replace-needed libpcap.so.0.8 libpcap.so.1 "${srcdir}/${_pkgname}"
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

