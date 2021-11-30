# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=siggo
pkgver=0.11.2
pkgrel=1
pkgdesc='A terminal gui for signal-cli, written in Go.'
arch=('x86_64')
url='https://github.com/derricw/siggo'
license=('GPL3')
depends=('libmatthew-unix-java' 'signal-cli' 'glibc')
makedepends=('go')
source=("https://github.com/derricw/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('4a1eb18bd90d34d2292a0f3f2917ad310088a3e4206c8b392f654077362aadcc2a38bd177be7451c4bc6fce456ba36ab1d021d4c0b616a7cad24d0ca16637eae')

build() {
  cd ${pkgname}-${pkgver}
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  install -Dm755 -t "${pkgdir}"/usr/bin/ "${srcdir}"/${pkgname}-${pkgver}/siggo
}
