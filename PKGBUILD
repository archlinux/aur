# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=find3-server
pkgver=3.3.0
pkgrel=1
pkgdesc="Code indexing and search written in Go"
arch=('x86_64' 'i686')
url="https://www.internalpositioning.com/"
license=('BSD')
depends=('go')
makedepends=('mercurial')
options=('!strip' '!emptydirs')
_gourl=github.com/schollz/find3/server/main

build() {
  GOPATH="$srcdir" go get -fix -v -d ${_gourl}
  cd "${srcdir}/src/${_gourl}"
  git co v${pkgver}
  go build -v
}

package() {
  cd "${srcdir}/src/${_gourl}"
  install -D main ${pkgdir}/usr/bin/find3-server
}

# vim:set ts=2 sw=2 et:
