# Maintainer: Proshiv85 <proshiv85 at gmail dot com>
pkgname=realcopy
pkgver=1.1.0
pkgrel=1
pkgdesc="GTK4 file utility that actually copies to the flashdrive"
arch=('x86_64' 'aarch64')
url="https://github.com/proshiv85-byte/realcopy"
license=('MIT')
depends=('gtk4' 'glib2' 'glibc')
makedepends=('pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Run `updpkgsums` after the v1.1.0 tag is pushed to GitHub.
sha256sums=('11cd65d6b72a0494e96b35df56fa4e366dd1c5e374a1225ae7d60ecdb39eff1b')

build() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
