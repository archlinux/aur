# Maintainer: Stefano Gabryel <esse[dot]gab2[at]gmail[dot]com>

pkgname=dirstalk
pkgver=1.1.1
pkgrel=2
pkgdesc='Multi threaded application designed to brute force paths on web servers, modern alternative to dirb and dirbuster'
url='https://github.com/stefanoj3/dirstalk'
arch=('x86_64')
license=('MIT')
makedepends=('go' 'git' 'dep')
options=('!emptydirs')
source=(https://github.com/stefanoj3/dirstalk/archive/${pkgver}.tar.gz)
sha512sums=('01da285dfe2b586773b954da897982870e6ef3fc9daa604dd1d6c5febb0473a14f71743485ed762a859e0337e25b47c4b425c0819366f905bc3d04f0d8e4de8e')
provides=('dirstalk')

prepare() {
  export GOPATH="${srcdir}/go"
  mkdir -p go/src/github.com/stefanoj3
  ln -rTsf ${pkgname}-${pkgver} go/src/github.com/stefanoj3/dirstalk
}

build() {
  cd go/src/github.com/stefanoj3/dirstalk
  export GOPATH="${srcdir}/go"
  dep ensure
  make build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 dist/dirstalk -t "${pkgdir}/usr/bin"
}
