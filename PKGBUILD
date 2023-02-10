# Maintainer: Andreas Wachter <buddyspencer@protonmail.com>

pkgname=gickup
pkgver=0.10.13
_pkgver=0.10.13
pkgrel=1
pkgdesc='Backup tool for your cloud git repositories'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/cooperspencer/gickup'
license=('APACHE')
depends=('glibc')
makedepends=('go' )
source=("https://github.com/cooperspencer/${pkgname}/archive/v${_pkgver}/${pkgname}-v${_pkgver}.tar.gz")
sha256sums=('86abd1ec84235ce6a9895d6a377599e6f01bcf7f40d4456dec539f3de4071782')

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
