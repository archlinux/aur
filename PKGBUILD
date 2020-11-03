# Maintainer: AsamK <asamk@gmx.de>
pkgname=git-absorb
pkgver=0.6.6
pkgrel=1
pkgdesc="git commit --fixup, but automatic "
arch=('i686' 'x86_64')
url="https://github.com/tummychow/git-absorb"
license=('BSD')
depends=(
  'libgit2'
)
makedepends=(
  'cargo'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tummychow/git-absorb/archive/${pkgver}.tar.gz")
sha256sums=('955069cc70a34816e6f4b6a6bd1892cfc0ae3d83d053232293366eb65599af2f')

build() {
  cd "${pkgname}-${pkgver}"

  LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

check() {
  cd "${pkgname}-${pkgver}"

  LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo test --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 target/release/"${pkgname}" -t "${pkgdir}/usr/bin/"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "Documentation/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
