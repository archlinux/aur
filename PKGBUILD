# Maintainer: Samuel Walladge <samuel@swalladge.net>
pkgname=searchr-git
_pkgname=searchr
pkgver=v0.2.0.r2.gf5ec286
pkgrel=1
pkgdesc="Command line local plain text files indexer and searcher"
arch=('i686' 'x86_64')
url="https://www.swalladge.net/projects/searchr/"
license=('GPL')
provides=("searchr")
conflicts=("searchr")
makedepends=('cargo' 'git')
source=("$pkgname::git+https://git.sr.ht/~swalladge/searchr")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release
}

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

