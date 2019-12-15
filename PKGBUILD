# Maintainer: Stefano Gabryel <esse[dot]gab2[at]gmail[dot]com>

pkgname=dirstalk
pkgver=1.3.2
pkgrel=1
pkgdesc='Multi threaded application designed to brute force paths on web servers, modern alternative to dirb and dirbuster'
url='https://github.com/stefanoj3/dirstalk'
arch=('x86_64')
license=('MIT')
makedepends=('go' 'git')
options=('!emptydirs')
source=(https://github.com/stefanoj3/dirstalk/archive/${pkgver}.tar.gz)
sha512sums=('446025552c2486a106bb49754054154f3f723179fa8e17d949df917c36a9fdc6c0b656d26976ed4426a7422e117289f46b325c9733703166c2a6371b79af6d03')
provides=('dirstalk')

prepare() {
  export GOPATH="${srcdir}/go"
  mkdir -p go/src/github.com/stefanoj3
  ln -rTsf ${pkgname}-${pkgver} go/src/github.com/stefanoj3/dirstalk
}

build() {
  cd go/src/github.com/stefanoj3/dirstalk
  export GOPATH="${srcdir}/go"
  make build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 dist/dirstalk -t "${pkgdir}/usr/bin"
}
