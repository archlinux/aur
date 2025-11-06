# Maintainer: Alexander Beck <dev@daallexx.eu>

_pkgname="etr"
pkgname="${_pkgname}-bin"
pkgver=0.0.2
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

sha256sums_aarch64=('f0ce6fd093f43c94639b98fa9ffb4b966ac56c9dfb523198ffc86a6908acb15a')
sha256sums_x86_64=('fa12acceb77165cf8e9edafbc6419ae8fa7e7cb34c5a37c5601650df0b32310b')

options=(!debug)

build() {
  echo "${srcdir}/${_pkgname}"
  patchelf --replace-needed libpcap.so.0.8 libpcap.so.1 "${srcdir}/${_pkgname}"
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

