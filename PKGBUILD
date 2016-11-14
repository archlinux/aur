# Maintainer: Alfredo Palhares <alfredo@palhares.me>

pkgname=rancher-compose
pkgver=0.11.0
pkgrel=2
pkgdesc="Docker compose compatible client to deploy to Rancher"
url='https://github.com/rancher/rancher-compose'
arch=('i686' 'x86_64')
license=('Apache')
makedepends=('go' 'godep' 'git' 'docker')
_gourl=github.com/rancher
source=("${pkgname}::git+https://${_gourl}/${pkgname}.git#tag=v${pkgver}-rc10")
sha256sums=('SKIP')

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  rm -rf "${srcdir}/src/${_gourl}/${pkgname}"
  mv -f "${pkgname}" "${srcdir}/src/${_gourl}/${pkgname}"
}

build() {
  msg2 "Build program"
  cd "${srcdir}/src/${_gourl}/${pkgname}"
  GOPATH="${srcdir}" PATH="${srcdir}/bin:${PATH}" make build
}

package() {
  cd "${srcdir}/src/${_gourl}/${pkgname}"
  mkdir -p ${pkgdir}/usr/bin/
  install -m755 bin/rancher-compose ${pkgdir}/usr/bin/rancher-compose
}

