# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=siggo
pkgver=0.10.0
pkgrel=1
pkgdesc='A terminal gui for signal-cli, written in Go.'
arch=('x86_64')
url='https://github.com/derricw/siggo'
license=('GPL3')
depends=('libmatthew-unix-java' 'signal-cli')
makedepends=('go')
source=("https://github.com/derricw/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('0e8c1fe8a14e6df45cee998eaddce05c43fd0585db33537b0b2042b47d75f1e3da724697213ba015b321ae1c7bdbdbcfd0120089488a71ccb2bef81323b2f2f7')

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
