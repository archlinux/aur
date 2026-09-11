# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=baru
pkgver=0.5.5
pkgrel=1
pkgdesc='A simple system monitor for WM statusbar'
arch=('x86_64')
url='https://github.com/doums/baru'
license=('MPL-2.0')
depends=('libnl' 'libpulse')
makedepends=('rust' 'cargo')
provides=('baru')
conflicts=('baru')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
#source=("$pkgname-$pkgver::git+file://${PWD}/../..")
sha256sums=('e34476f6953e6a25e0b909da6e42df46a3192f11d5ef320d99a52b8e8199982b')
_pkgdir="$pkgname-$pkgver"

build() {
  cd "$srcdir/$_pkgdir"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$_pkgdir"
  install -Dvm 755 "$srcdir/$_pkgdir/target/release/baru" "$pkgdir/usr/bin/baru"
  install -Dvm 644 "$srcdir/$_pkgdir/baru.yaml" "$pkgdir/usr/share/baru/baru.yaml"
}

