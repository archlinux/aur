# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=lokinet-bin
_pkgname=lokinet
pkgver=0.8.3
pkgrel=1
pkgdesc='Anonymous, decentralized and IP based overlay network for the internet. [LOKI, OXEN]'
url='https://github.com/oxen-io/loki-network'
arch=('x86_64')
license=('GPL3')
conflicts=('lokinet')
source=("${_pkgname}-$pkgver.tar.xz::$url/releases/download/v$pkgver/${_pkgname}-linux-amd64-v$pkgver.tar.xz")
sha256sums=('8e82f8ac69f808e49b766a7bf5a04b82e1576f9c867a371de7dadfcb846447bd')

build() {
  tar -xf ${_pkgname}-$pkgver.tar.xz
}

package() {
  cd ${_pkgname}-linux-amd64-v$pkgver

  # create the necessary directory structure
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"

  # install binaries on system
  install -m 755 lokinet "${pkgdir}/opt/${_pkgname}"
  install -m 755 lokinet-bootstrap "${pkgdir}/opt/${_pkgname}"
  install -m 755 lokinet-vpn "${pkgdir}/opt/${_pkgname}"

  # links scripts to /usr/bin
  ln -s /opt/${_pkgname}/lokinet "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/lokinet-bootstrap "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/lokinet-vpn "${pkgdir}/usr/bin"
}
