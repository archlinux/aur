# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=baru
pkgver=0.5.0
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
sha256sums=('0ac488163636e100dd86326e41630832b65412db9f873f9ac43300e2e342191d')
_pkgdir="$pkgname-$pkgver"

build() {
  cd "$srcdir/$_pkgdir"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$_pkgdir"
  install -Dvm 755 "$srcdir/target/release/baru" "$pkgdir/usr/bin/baru"
  install -Dvm 644 "$srcdir/$_pkgdir/baru.yaml" "$pkgdir/usr/share/baru/baru.yaml"
}

