# Maintainer: Ensar Sarajčić <es.enar at gmail dot com>
#
pkgname="fbihtax-git"
_pkgname="fbihtax"
pkgver="0.3.0"
pkgrel=1
epoch=
pkgdesc="CLI tool to help manage tax payments in FBiH (Bosnia and Herzegovina Federation) written in Rust."
arch=('any')
url="https://github.com/esensar/fbihtax"
license=('MIT')
groups=()
depends=()
makedepends=('cargo')
checkdepends=()
optdepends=("pdftk: PDF output support")
provides=('fbihtax')
conflicts=('fbihtax')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=(SKIP)
validpgpkeys=()

build() {
  cd "$srcdir/$_pkgname"

  cargo build --release --target-dir target
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm775 "target/release/fbihtax" "$pkgdir/usr/bin/fbihtax"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/fbihtax/LICENSE"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh:
