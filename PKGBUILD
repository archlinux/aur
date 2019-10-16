# Maintainer: JR Boyens <jboyens@fooninja.org>

pkgname=pgcenter
pkgver=0.6.4
pkgrel=1
pkgdesc='Command-line admin tool for observing and troubleshooting Postgres'
arch=('x86_64')
url='https://github.com/lesovsky/pgcenter'
license=('custom:BSD3')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('be6106217f84c235d8803f307aa6e8d0010c5c447cfa8b694fe48dbc45b04291')

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

# vim:set ts=2 sw=2 et:
