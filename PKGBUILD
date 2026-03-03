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
sha256sums=('90fcdfd169f2e018c7027759b292111277897b2362ea4ceacf1586488c118f54')

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
