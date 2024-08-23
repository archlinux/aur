# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Frank Seifferth <frankseifferth@posteo.net>

pkgname=libxlsxwriter
pkgver=1.1.8
pkgrel=1
pkgdesc='A C library for creating Excel XLSX files.'
arch=('i686' 'x86_64')
url='http://libxlsxwriter.github.io'
license=('LicenseRef-Multiple')
depends=(zlib)
makedepends=(python-pytest cmake)
source=("https://github.com/jmcnamara/libxlsxwriter/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('4d1df3b66e694629025ba4154a746d896f9fa32c727267cfbeacf72a3fc70d1b34c7bc767a03bca81395bbe2ff366fc4f4184c2c40126bc6b2d58b33a758cc8f')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/"
  make test_cmake
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -D -m644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
