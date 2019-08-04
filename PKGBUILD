# Maintainer: Stefano Gabryel <esse[dot]gab2[at]gmail[dot]com>

pkgname=dirstalk
pkgver=1.2.0
pkgrel=1
pkgdesc='Multi threaded application designed to brute force paths on web servers, modern alternative to dirb and dirbuster'
url='https://github.com/stefanoj3/dirstalk'
arch=('x86_64')
license=('MIT')
makedepends=('go' 'git' 'dep')
options=('!emptydirs')
source=(https://github.com/stefanoj3/dirstalk/archive/${pkgver}.tar.gz)
sha512sums=('6030ba784dc46ae30defb854372105438cc2151b4cfa21aebe3e11e43394f5064e87f0ea0695bca6fa05ef42707e68c1cebdd6733f2dcb7ea7cf41fbeb8c5b90')
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
