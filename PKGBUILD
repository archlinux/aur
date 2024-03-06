# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=bed
pkgver=0.2.4
pkgrel=1
pkgdesc="binary editor written in Go"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/itchyny/bed"
license=('MIT')
depends=('glibc')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/itchyny/bed/archive/v${pkgver}.tar.gz")
sha256sums=('01d0a28a8e0b66dc73370de2c2b22368ca9c653bf6c7ae4b3bc2f13af42bc788')
_goname="github.com/itchyny/bed"


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  make build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 bed "${pkgdir}/usr/bin/bed"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
