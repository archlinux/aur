# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Olivier Biesmans <o dot archlinux at biesmans dot fr>

pkgname=certigo
pkgver=1.17.1
pkgrel=1
pkgdesc='A utility to examine and validate certificates in a variety of formats'
arch=('x86_64' 'i686')
url='https://github.com/square/certigo'
license=('MIT')
makedepends=('go' 'git')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/square/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('34bcf42819ef12f16e257a9fae303ddd7523fa522d22ddf20b81a19898e4d06861c6831c31872ee35685c6ef785883b9686404baf3dedee8382be305d38d9765')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOFLAGS="-buildmode=pie -gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
  export CGO_CPPFLAGS="-D_FORTIFY_SOURCE=2"
  export CGO_LDFLAGS="-Wl,-z,relro,-z,now"
  ./build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
