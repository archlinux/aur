# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=pg-spgist_hamming-git
pkgver=r42.9fa70b0
pkgrel=1
pkgdesc="Fast hamming-distance range searches via native GiST Indexing facility in PostgreSQL"
arch=('x86_64')
url="https://github.com/fake-name/pg-spgist_hamming"
license=('BSD')
depends=('postgresql')
makedepends=('clang')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=()
source=("git+https://github.com/fake-name/pg-spgist_hamming.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${pkgname%-git}/bktree"
  make
}

# makefile only has installcheck
# check() {
#   cd "${pkgname%-git}/bktree"
#   make -k check
# }

package() {
  cd "${pkgname%-git}/bktree"
  make DESTDIR="$pkgdir/" install

  # license
  cd ..
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname%-git}" LICENSE 
}
