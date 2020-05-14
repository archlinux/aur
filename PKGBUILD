# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ops
pkgver=0.1.10
pkgrel=1
pkgdesc="Build and run nanos unikernels"
arch=('x86_64')
url='https://ops.city'
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nanovms/ops/archive/${pkgver}.tar.gz")
sha256sums=('c45d094e3fe8fb51878e0befeefce90d7492cce03f9d17cf0f47420cc6c40d73')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  make deps 
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  make build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ops "${pkgdir}/usr/bin/ops"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/ops/LICENSE"
  go clean -modcache #Remove go local cache
}