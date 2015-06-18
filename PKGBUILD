# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=godebug-git
pkgver=r185.5f2c0ee
pkgrel=1
pkgdesc="Cross-platform debugger for Go"
arch=('any')
url="https://github.com/mailgun/godebug"
license=('Apache2')
makedepends=('go')
options=('!strip')
provides=godebug

source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver(){
  cd "$srcdir/${pkgname}"
  printf "r%d.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${pkgname}"
  GOPATH="${srcdir}/${pkgname}" go get -d -v
}

build() {
  cd "${srcdir}/${pkgname}"
  GOPATH="${srcdir}/${pkgname}" go fix
  GOPATH="${srcdir}/${pkgname}" go build -v
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${provides}"
}
