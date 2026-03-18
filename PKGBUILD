# Maintainer: Alexander Beck <dev@daallexx.eu>

_pkgname="etr"
pkgname="${_pkgname}-bin"
pkgver=1.1.3
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
source=("${_pkgname}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
sha256sums=('82ca59cd38a69db882905a10d662618273f4d6d3b5372da18bf54b170521824d')

options=(!debug)

build() {
  echo "${srcdir}/${_pkgname}"
  patchelf --replace-needed libpcap.so.0.8 libpcap.so.1 "${srcdir}/${_pkgname}"
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

