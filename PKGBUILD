# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=chromeos-rootdev-git
pkgver=r19.fc57068
pkgrel=1
pkgdesc='ChromeOS version of rootdev tool'
url='http://sites.google.com/a/google.com/chromeos-partner/hardware-control-and-debug'
arch=(i686 x86_64)
depends=(glibc)
license=(BSD)
source=(git+https://chromium.googlesource.com/chromiumos/third_party/rootdev)
sha1sums=('SKIP')

pkgver() {
  cd rootdev
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd rootdev
  sed 's/-Werror//' -i Makefile
}

build() {
  cd rootdev
  make
}

package() {
  cd rootdev
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m755 -d "$pkgdir"/usr/{bin,lib}
  install -m755 -t "$pkgdir/usr/bin" rootdev
  install -m644 -t "$pkgdir/usr/lib" librootdev.so.1.0
  ln -s /usr/lib/librootdev.so.1.0  $pkgdir/usr/lib/librootdev.so.1
  ln -s /usr/lib/librootdev.so.1.0  $pkgdir/usr/lib/librootdev.so
}
