# Maintainer: Chad Kunde <Kunde21@gmail.com>

pkgname=gopls
pkgver=0.4.1
pkgrel=0
pkgdesc='Language server for Go programming language'
arch=(x86_64 aarch64 armv7h armv7l)
url='https://github.com/golang/tools/blob/master/gopls'
license=(BSD)
depends=(glibc)
makedepends=('git'
             'go>=1.12')
conflicts=('go-tools'
           'go-tools-complete-git')
provides=('gopls')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/golang/tools/archive/gopls/v${pkgver}.tar.gz")
sha256sums=('da0594c469cb558f8059dd8edaf9fd662310ec4bc7ae41bb9b0a7266501472ad')

prepare() {
  cd "tools-${pkgname}-v${pkgver}/${pkgname}"

  GOPATH="${srcdir}" GO111MODULE=on go mod download
}

build() {
  cd "tools-${pkgname}-v${pkgver}/${pkgname}"

  GOPATH="${srcdir}" GO111MODULE=on go build -o "../../$pkgname" -trimpath
  GOPATH="${srcdir}" GO111MODULE=on go clean -modcache
  mv ../LICENSE ../../LICENSE
}

package() {
  install -Dm755 "${pkgname}" -t "${pkgdir}"/usr/bin/
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}

# vim: ts=2 sw=2 et:
