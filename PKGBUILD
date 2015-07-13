# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname='htcat'
pkgver='1.0.2'
pkgrel='1'
pkgdesc='Utility to perform parallel, pipelined execution of a single HTTP GET'
arch=('i686' 'x86_64')
url='https://github.com/htcat/htcat'
license=('custom')
makedepends=('go')
depends=('glibc')
options=('strip' '!emptydirs')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('67b68b8075ac5b09fec8f364a249544ef83eb7f146b60b48eb63533c5c8fc862cb23dcd6dc98aec6090fde7ef8a56ed2b2fc98484363fbd784f25089081c4987')

prepare () {
  cd "${pkgname}-${pkgver}"
  # Go packaging conventions madness...
  mkdir -p .g/src/github.com/htcat
	ln -sf "$(pwd)" .g/src/github.com/htcat/htcat
}

build() {
  cd "${pkgname}-${pkgver}"
	GOPATH="$(pwd)/.g" go build cmd/htcat/htcat.go
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 htcat \
  	"${pkgdir}/usr/bin/htcat"
  install -Dm644 README.md \
  	"${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 LICENSE \
  	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
