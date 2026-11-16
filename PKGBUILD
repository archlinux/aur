# Maintainer: Keil <keilmillerjr@outlook.com>

pkgname=endlines
pkgver=1.9.2
pkgrel=4
pkgdesc='Convert text files between LF, CRLF and CR line endings'
arch=('x86_64')
url='https://github.com/mdolidon/endlines'
license=('Apache-2.0')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('574702640e014197bc80fb9f80dc433c99db0f6c792ab86274a4dd1f4b936cdf')

build() {
  cd "$pkgname-$pkgver"
  # The Makefile hardcodes CFLAGS and LDFLAGS; passing them on the command line
  # replaces its values with Arch's flags (plus the C standard it needs)
  make CFLAGS="$CPPFLAGS $CFLAGS -std=c99" LDFLAGS="$LDFLAGS"
}

check() {
  cd "$pkgname-$pkgver/test"
  bash runtest.sh
}

package() {
  cd "$pkgname-$pkgver"
  # Upstream's install target moves the binary into /usr/local/bin
  install -Dm755 endlines -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
