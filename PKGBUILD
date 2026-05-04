# Maintainer: Andreas Wachter <buddyspencer@protonmail.com>

pkgname=gickup
pkgver=0.10.42
_pkgver=0.10.42
pkgrel=1
pkgdesc='Backup tool for your cloud git repositories'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/cooperspencer/gickup'
license=('APACHE')
depends=('glibc')
makedepends=('go' )
source=("https://github.com/cooperspencer/${pkgname}/archive/v${_pkgver}/${pkgname}-v${_pkgver}.tar.gz")
sha256sums=('05adc486f5f6a72b173ef1921608a9458d560e422010b78c780703943afd8ebc')

prepare() {
  cd "${pkgname}-${_pkgver}"
  mkdir -p build/
}

build() {
  cd "${pkgname}-${_pkgver}"
  go build -ldflags '-X "main.version=v'${pkgver}'"' -o build 
}

package() {
  install -D -m755 "${srcdir}/${pkgname}-${_pkgver}/build/gickup" "${pkgdir}/usr/bin/gickup"
}