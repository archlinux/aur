# Maintainer: Clar Charr <clar@charr.xyz>
pkgname=rrun-ssh
_pkgbase=rrun
pkgver=0.3.0
pkgrel=1
pkgdesc="Remote run utility; runs a command in an SSHFS-mounted directory."
arch=(i686 x86_64)
url="https://github.com/clarcharr/$_pkgbase"
license=(CC0)
makedepends=(rust)
conflicts=(rrun)
source=(git+https://github.com/clarcharr/$_pkgbase#$pgkver)
sha256sums=(SKIP)
validpgpkeys=(4BDA23A98EE4E049CBC3BA6C69DA5B388573EE35)
_binaries=(rrun rpwd)

prepare() {
  cd $_pkgbase
  git tag --verify $pkgver
}
build() {
  cd "$srcdir/$_pkgbase"
  cargo build --release
}
package() {
  cd "$pkgdir"
  mkdir -p usr/bin
  for binary in ${_binaries[@]}; do
    install -m755 "$srcdir/$_pkgbase/target/release/$binary" usr/bin/$binary
  done
}
