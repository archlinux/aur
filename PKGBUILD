# Maintainer: Stefano Gabryel <esse[dot]gab2[at]gmail[dot]com>

pkgname=dirstalk
pkgver=1.3.3
pkgrel=1
pkgdesc='Multi threaded application designed to brute force paths on web servers, modern alternative to dirb and dirbuster'
url='https://github.com/stefanoj3/dirstalk'
arch=('any')
license=('MIT')
makedepends=('go' 'git')
options=('!emptydirs')
source=(https://github.com/stefanoj3/dirstalk/archive/${pkgver}.tar.gz)
sha512sums=('282f6de56054b3d6a92af3af0d658623213af6233dda667ff59fa890d1ef09e229f192c6fb0a3ba7e73ae0617637c342d71a17c41f703c3b10a44393873ab4ea')
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
