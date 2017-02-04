pkgname=filegive
pkgver=0.7.5
pkgrel=1
pkgdesc="Easy sending of files, point-to-point"
url="http://vicerveza.homeunix.net/~viric/cgi-bin/filegive"
arch=('x86_64' 'i686')
license=('AGPL3')
depends=('glibc')
makedepends=('go' 'git')
source=("http://vicerveza.homeunix.net/~viric/cgi-bin/filegive/tarball/filegive-${pkgver}.tar.gz?uuid=v${pkgver}")
sha256sums=('39ad3d2a0bd4b4f235e73c382afd1a9bd913af3c87870231555ef87a9eea99ef')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p go
  export GOPATH="${srcdir}/${pkgname}-${pkgver}/go"
  go get -u github.com/jackpal/go-nat-pmp
  go build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 filegive-${pkgver} "$pkgdir/usr/bin/filegive"
}
