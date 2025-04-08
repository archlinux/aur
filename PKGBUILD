# Maintainer: Alexander Thaller <aur+hstdb@alexander.thaller.ws>
pkgname=hstdb-git
_pkgname=hstdb
_reponame=hstdb
pkgver=r155.1fa4460
pkgrel=1
pkgdesc="Better history management for zsh."
arch=('x86_64')
url="https://github.com/AlexanderThaller/hstdb"
license=('MIT')
depends=('sqlite')
makedepends=('cargo')
source=("git+https://github.com/AlexanderThaller/hstdb.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_reponame"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$srcdir/$_reponame"
  RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
}

package() {
  cd "$srcdir/$_reponame"
  install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
}
