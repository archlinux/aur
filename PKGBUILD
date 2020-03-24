# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ops
pkgver=0.1.9
pkgrel=1
pkgdesc="Ops - build and run nanos unikernels"
arch=('x86_64')
url='https://ops.city'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nanovms/ops/archive/${pkgver}.tar.gz")
md5sums=('89fff6ebd4d38ce5bd8a7561e5b51e0d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  make deps
  make build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ops "${pkgdir}/usr/bin/ops"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/ops/LICENSE"
  go clean -modcache #Remove go local cache
}