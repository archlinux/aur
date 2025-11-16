# Maintainer: Alexander Beck <dev@daallexx.eu>

_pkgname="etr"
pkgname="${_pkgname}-bin"
pkgver=0.0.7
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

sha256sums_aarch64=('40a88e8214f82ab5462ec0666d1bf22ad5d6217fb765bd17118dbc3ea7059ef1')
sha256sums_x86_64=('92370ee640a21938e3a8edba1931b32970e4beb217833c3090b72aa162f816b7')

options=(!debug)

build() {
  echo "${srcdir}/${_pkgname}"
  patchelf --replace-needed libpcap.so.0.8 libpcap.so.1 "${srcdir}/${_pkgname}"
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

