# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=milcheck
pkgver=0.3.5
pkgrel=1
pkgdesc="A CLI to get pacman mirrorlist status and the Arch Linux latest news"
arch=('x86_64')
url='https://github.com/doums/milcheck'
license=('MPL2')
depends=('openssl' 'gcc-libs')
makedepends=('rust' 'cargo')
provides=('milcheck')
conflicts=('milcheck')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c8e433e790f2ac0eaa4c5a12b0282734901f30deac4cd8552a62e5e2b147fb8')
_pkgdir="$pkgname-$pkgver"

build() {
  cd "$srcdir/$_pkgdir"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$srcdir/$_pkgdir/target/release/milcheck" "$pkgdir/usr/bin/milcheck"
}

