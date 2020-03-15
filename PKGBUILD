# Maintainer: AsamK <asamk@gmx.de>
pkgname=git-absorb
pkgver=0.5.0
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
sha256sums=('c4ef4fa28222773d695aab7711abbfac7e81c35a37eafe45f79d045516df28b1')

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
}
