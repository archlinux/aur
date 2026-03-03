pkgname=openbitdo
pkgver=0.0.1rc1
_upstream_tag=v0.0.1-rc.1
pkgrel=1
pkgdesc="Beginner-first clean-room 8BitDo utility"
arch=('x86_64' 'aarch64')
url="https://github.com/bybrooklyn/openbitdo"
license=('BSD-3-Clause')
depends=('hidapi')
makedepends=('cargo')
source=("${pkgname}-${_upstream_tag}.tar.gz::${url}/archive/refs/tags/${_upstream_tag}.tar.gz")
sha256sums=('f135526aade35d142087b277877a83114465c93f73745fc2f0bb669fe7653fdd')

build() {
  cd "${srcdir}/openbitdo-${_upstream_tag#v}/sdk"
  cargo build --release -p openbitdo
}

package() {
  cd "${srcdir}/openbitdo-${_upstream_tag#v}"
  install -Dm755 "sdk/target/release/openbitdo" "${pkgdir}/usr/bin/openbitdo"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/openbitdo/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/openbitdo/LICENSE"
}
