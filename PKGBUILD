# Maintainer: Clar Charr <clar@charr.xyz>
pkgname=swc-hosts
pkgver=0.2.1
pkgrel=1
pkgdesc="Safely parse /etc/hosts from Someone Who Cares."
arch=(i686 x86_64)
url="https://github.com/clarcharr/$pkgname"
license=(CC0)
makedepends=(rust)
source=(git+https://github.com/clarcharr/$pkgname#$pgkver)
sha256sums=(SKIP)
validpgpkeys=(4BDA23A98EE4E049CBC3BA6C69DA5B388573EE35)
_binaries=(swc-hosts)
prepare() {
  cd $pkgname
  git tag --verify $pkgver
}
build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}
package() {
  cd "$pkgdir"
  mkdir -p usr/bin
  for binary in ${_binaries[@]}; do
    install -m755 "$srcdir/$pkgname/target/release/$binary" usr/bin/$binary
  done
}
