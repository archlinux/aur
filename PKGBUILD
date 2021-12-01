# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Olivier Biesmans <o dot archlinux at biesmans dot fr>

pkgname=certigo
pkgver=1.13.0
pkgrel=1
pkgdesc='A utility to examine and validate certificates in a variety of formats'
arch=('x86_64' 'i686')
url='https://github.com/square/certigo'
license=('MIT')
makedepends=('go-pie' 'git')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/square/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('06d7663b6c46904a020edcaeaceb6476fd808677a1ee0c11b3aaf1926c84da5b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
  ./build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
