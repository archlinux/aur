# Maintainer: Samuel Walladge <samuel@swalladge.net>
pkgname=pc-git
_pkgname=pc
pkgver=v0.1.0.r1.g1e88bfa
pkgrel=1
pkgdesc="Command line client for pastebins"
arch=('i686' 'x86_64')
url="https://github.com/swalladge/pc"
license=('APACHE' 'MIT')
provides=("pc")
conflicts=("pc")
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/swalladge/pc")
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
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}

