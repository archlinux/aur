# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname='htcat'
pkgver='1.0.0'
pkgrel='2'
pkgdesc='Utility to perform parallel, pipelined execution of a single HTTP GET'
arch=('i686' 'x86_64')
url='https://github.com/htcat/htcat'
license=('custom')
makedepends=('go')
depends=('glibc')
options=('strip' '!emptydirs')
source=("https://github.com/htcat/htcat/archive/v1.0.0.tar.gz")

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

sha512sums=('582928236207255d9b65e579e61385f1de10085f537a1921ff167e96089141060a155bb8f38da01cde0512970af285260d90ace68427dda2319853fdb0ee546f')
