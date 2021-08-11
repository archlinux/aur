# Maintainer: Gyara <laxect39@gmail.com>

pkgname=xtr-git
_pkgname=xtr
pkgver=r41.ae762fb
pkgrel=1
pkgdesc="Translation tools for rust"
url="https://github.com/woboq/tr"
conflicts=('xtr')
provides=('xtr')
arch=("x86_64")
license=("AGPL")
depends=("cargo")
makedepends=('git')
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "tr/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/tr"
  RUSTUP_TOOLCHAIN=stable cargo build --release --all-features --target-dir=target -p xtr
}

package() {
  cd "$srcdir/tr"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$_pkgname"
}

# vim: ts=2 sw=2 et:
