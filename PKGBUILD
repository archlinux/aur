# Maintainer: Alexander Beck <dev@daallexx.eu>

_pkgname="etr"
pkgname="${_pkgname}-bin"
pkgver=0.0.10
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

sha256sums_aarch64=('2666fe02fde68d57c2fa38e01b0cd86a5d56445f680c8f3df2a3e58758ed2ff3')
sha256sums_x86_64=('11571bf9cb4d4b1a150c882d03cddf0e01b8c8157cf3717ec3e91c4799ae79c9')

options=(!debug)

build() {
  echo "${srcdir}/${_pkgname}"
  patchelf --replace-needed libpcap.so.0.8 libpcap.so.1 "${srcdir}/${_pkgname}"
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

