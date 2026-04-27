# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=milcheck
pkgver=0.3.6
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
sha256sums=('f065b8fe70d770c989f65ac04c7b7bb2a39f2f0cc4d62f3247647bc00dcad777')
_pkgdir="$pkgname-$pkgver"

build() {
  cd "$srcdir/$_pkgdir"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$srcdir/$_pkgdir/target/release/milcheck" "$pkgdir/usr/bin/milcheck"
}

