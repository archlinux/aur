# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=bed
pkgver=0.2.5
pkgrel=1
pkgdesc="binary editor written in Go"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/itchyny/bed"
license=('MIT')
depends=('glibc')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/itchyny/bed/archive/v${pkgver}.tar.gz")
sha256sums=('a8fa1bddcf65fd3dd52ede2f3fc1cb2840420e9a24fb8fd8c950a9bab9d86f70')
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
