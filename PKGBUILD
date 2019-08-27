# Maintainer: Stefano Gabryel <esse[dot]gab2[at]gmail[dot]com>

pkgname=dirstalk
pkgver=1.3.0
pkgrel=1
pkgdesc='Multi threaded application designed to brute force paths on web servers, modern alternative to dirb and dirbuster'
url='https://github.com/stefanoj3/dirstalk'
arch=('x86_64')
license=('MIT')
makedepends=('go' 'git' 'dep')
options=('!emptydirs')
source=(https://github.com/stefanoj3/dirstalk/archive/${pkgver}.tar.gz)
sha512sums=('bafa76ce85f0d87bd63e814f120f2a16111aeecdeaef52f853415fcac7e8823aa04d788ae76a3ce4ebc0465321142392c2e8081364af624e11d9fe25b385e68c')
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
