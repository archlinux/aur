# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=baru
pkgver=0.5.2
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
sha256sums=('14a23c290660efe202c92de9c23e0e1b7c673288f38be80772b058eef72c20fd')
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

