# Maintainer: Thor K. Høgås <thor@roht.no>
pkgname=pandoc-ac-git
_pkgname=pandoc-ac
pkgver=0.2.0.r5.56a3957
pkgrel=2
pkgdesc="Simple Pandoc filter for a clean syntax to LaTeX acronyms"
arch=('x86_64')
url="https://github.com/thor/pandoc-ac"
license=('MIT' 'Apache')
groups=()
depends=()
makedepends=('cargo')
checkdepends=()
optdepends=()
provides=('pandoc-ac')
conflicts=('pandoc-ac')
backup=()
source=("$_pkgname::git+https://github.com/thor/pandoc-ac.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$_pkgname"
  cargo build --release --locked --all-features
}

check() {
  cd "$_pkgname"
  cargo test --release --locked --all-features
}

package() {
  cd "$_pkgname"
  install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
}
