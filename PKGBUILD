# Maintainer: n0nvme <svmpl3nvm3@gmail.com>
pkgname='kcl-lang'
pkgver=0.11.0
pkgrel=1
pkgdesc='KCL Programming Language'
url='https://github.com/kcl-lang/cli'
arch=('x86_64')
license=('Apache')
provides=('kcl')
depends=()
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('cab864ab3641ad9bacba5e13c0241a2ae495682d2b2a9327c7c4804213c97a1b')

build() {
  cd "cli-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"

  make build
}

package() {
  cd "cli-${pkgver}"
  ls
  install -Dm755 "bin/kcl" "${pkgdir}/usr/bin/kcl"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/kcl"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/kcl"
}
