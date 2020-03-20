# Maintainer: Chad Kunde <Kunde21@gmail.com>

pkgname=gopls
pkgver=0.3.4
pkgrel=1
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
sha256sums=('6b223742cba371721bfdac644f04c6c2b592b3b0e284da5bb4ec53ab9cd60998')

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
