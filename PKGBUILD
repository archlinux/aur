# Maintainer: Alexander Beck <dev@daallexx.eu>

_pkgname="etr"
pkgname="${_pkgname}-bin"
pkgver=1.0.0
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

sha256sums_aarch64=('bb32f6dd09b906bf2d508bfd4a8bc6e420fcb09deb5d2d27c66116996e26561a')
sha256sums_x86_64=('060d0acb40ef90b38eaa653771f6528154ea93b0deeb69de48932dc0d0da43ab')

options=(!debug)

build() {
  echo "${srcdir}/${_pkgname}"
  patchelf --replace-needed libpcap.so.0.8 libpcap.so.1 "${srcdir}/${_pkgname}"
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

