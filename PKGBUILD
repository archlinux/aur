# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>
# Contributor: Bennett Piater <bennett at piater dot name>

pkgname=doctl
pkgver=1.13.0
pkgrel=1
pkgdesc='A command line tool for DigitalOcean services'
arch=('i686' 'x86_64')
url='https://github.com/digitalocean/doctl'
license=('APACHE')
makedepends=('go' 'git')
conflicts=('doctl-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/digitalocean/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/build"
  go get -t -d -v
  make native
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/build"
  go test -x -v .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 builds/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim: set et sw=2 sts=2:
sha256sums=('24751fcc41ca1cb9472fcb664906637d6fc7bab64dcdcdf8930386e1b218ac31')
