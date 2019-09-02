# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=dnsmorph
pkgver=1.2.6
pkgrel=1
pkgdesc='Domain name permutation engine written in Go'
arch=('any')
url='https://github.com/netevert/dnsmorph'
license=('MIT')
makedepends=('go')
source=("https://github.com/netevert/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('36ef1e6e4208580475dd0a61c81d3d14e2806e60fa01376ad735b5f236665f6f')

build() {
  export GOPATH="${srcdir}"
  mkdir -p "${srcdir}/src/github.com/netevert"
  ln -fsT "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/netevert/${pkgname}"
  cd "${srcdir}/src/github.com/netevert/${pkgname}"
  go get \
   -gcflags "all=-trimpath=${srcdir}/src" \
   -asmflags "all=-trimpath=${srcdir}/src" \
   -v ./...
}

package() {
  # binary
  install -Dm755 bin/dnsmorph "${pkgdir}/usr/bin/dnsmorph"
}
