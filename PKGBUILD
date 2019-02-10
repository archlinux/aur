# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=pgcenter
pkgver=0.6.0
pkgrel=1
pkgdesc='Command-line admin tool for observing and troubleshooting Postgres'
arch=('x86_64')
url='https://github.com/lesovsky/pgcenter'
license=('custom:BSD3')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('eb4cb3fda23312ad93f4f59c6f89aa1797d21aa6705812934f3f02e3a762e012')

prepare() {
  cd ${pkgname}-${pkgver}
  go mod download
}

build() {
  cd ${pkgname}-${pkgver}
  go build -o ${pkgname} \
    -asmflags all="-trimpath=${PWD}" \
    -gcflags all="-trimpath=${PWD}" \
    -ldflags all="-extldflags=${LDFLAGS}"
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
