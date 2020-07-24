# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec
pkgver=2.4.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64" "i686")
url="https://github.com/securego/gosec"
license=("Apache")
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/securego/gosec/archive/v${pkgver}.tar.gz")
sha256sums=('5a567944ff509f39fd3f61955bfd6541b95e1971aff2cd477a030aeec2d73205')

build() {
  cd ${pkgname}-${pkgver}/cmd/gosec
  go build \
  -trimpath \
  -buildmode=pie \
  -mod=readonly \
  -modcacherw \
  -ldflags "-extldflags \"${LDFLAGS}\"" \
  .
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 cmd/gosec/gosec ${pkgdir}/usr/bin/gosec
}
