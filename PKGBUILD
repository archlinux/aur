# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=milcheck
pkgver=0.3.7
pkgrel=1
pkgdesc="A CLI to get pacman mirrorlist status and the Arch Linux latest news"
arch=('x86_64')
url='https://github.com/doums/milcheck'
license=('MPL-2.0')
depends=('openssl' 'gcc-libs')
makedepends=('rust' 'cargo')
provides=('milcheck')
conflicts=('milcheck')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e5f80ef7001dc1f837eaba878c5f0297b3231b2f19e653e750d9e2fabbe2540a')
_pkgdir="$pkgname-$pkgver"

build() {
  cd "$srcdir/$_pkgdir"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$srcdir/$_pkgdir/target/release/milcheck" "$pkgdir/usr/bin/milcheck"
}

