# Maintainer: csmantle <aur at csmantle dot top>

_pkgname=searchfox-cli
pkgname="$_pkgname"-git
pkgver=0.10.11.r0.ga767d65
pkgrel=2
pkgdesc='CLI tool for querying the searchfox.org code search engine'
arch=('x86_64' 'aarch64' 'loong64') 
url='https://github.com/padenot/searchfox-cli'
license=('Apache-2.0 OR MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/padenot/searchfox-cli.git')
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "$srcdir"/searchfox-cli
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/searchfox-cli
  cargo build --release --locked --all-features
}

check() {
  cd "$srcdir"/searchfox-cli
  cargo test --release --locked --all-features
}

package() {
  cd "$srcdir"/searchfox-cli

  cargo install --no-track --frozen --all-features --root "$pkgdir/usr/" --path ./searchfox-cli
  install -vDm644 README.md "$pkgdir"/usr/share/doc/"$_pkgname"/README.md
  install -vDm644 LICENSE-APACHE "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE-APACHE
  install -vDm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE-MIT
}
