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
sha256sums=('55008b60355f93be0ea70a4e119797281691ce01f424275b2830e1a4c8995ef4')

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
