# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Mick Elliot <micke@sfu.ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=muscle
pkgver=5.1
pkgrel=1
pkgdesc="Multiple sequence comparison by log-expectation"
arch=('i686' 'x86_64')
url="https://github.com/rcedgar/muscle"
license=('GPL')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('091d9f8733b92ff106c2a8eb274d1e5a57960d397a2068d8638d6002e8880dab')

prepare() {
  # -static flag does not find -lgomp (part of gcc-libs)
  sed -i "/LDFLAGS += -static/s:-static::" "$srcdir"/$pkgname-$pkgver/src/Makefile
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make -C src
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm755 src/$(uname)/muscle "$pkgdir"/usr/bin/muscle
}
