# Maintainer: lmartinez
# Contributor: Wesley Moore <wes@wezm.net>

pkgname=dutree-git
_pkgname=${pkgname%-git}
pkgver=0.2.16.r2.g83fc255
pkgrel=1
pkgdesc='A tool to analyze file system usage written in Rust'
arch=('x86_64')
url='https://github.com/nachoparker/dutree'
license=('GPL3')
depends=('gcc-libs')
makedepends=('git' 'cargo')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver()  {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$pkgname"
  cargo build --release --locked
}

check() {
  cd "$pkgname"
  cargo test --release --locked
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

