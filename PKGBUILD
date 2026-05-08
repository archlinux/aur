# Maintainer: csmantle <aur at csmantle dot top>

_pkgname=jj-starship
pkgname="$_pkgname"-git
pkgver=0.7.0.r0.g76cf006
pkgrel=1
pkgdesc='Unified Git/JJ Starship prompt module'
arch=('x86_64' 'aarch64' 'loong64')
url='https://github.com/dmmulroy/jj-starship'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/dmmulroy/jj-starship.git')
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "$srcdir"/"$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/"$_pkgname"
  cargo build --release --locked
}

check() {
  cd "$srcdir"/"$_pkgname"
  cargo test --locked
}

package() {
  cd "$srcdir"/"$_pkgname"

  install -vDm755 target/release/"$_pkgname" "$pkgdir"/usr/bin/"$_pkgname"
  install -vDm644 README.md "$pkgdir"/usr/share/doc/"$_pkgname"/README.md
  install -vDm644 LICENSE "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE
}
