# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Håvard Espeland <espeland@acm.org>
pkgname=libpfm4
pkgver=4.6.0
conflicts=('libpfm3')
pkgrel=1
pkgdesc="Library to encode performance events for use by perf tool"
arch=('x86_64' 'i686')
url="http://perfmon2.sourceforge.net/"
license=('MIT')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/perfmon2/libpfm4/libpfm-$pkgver.tar.gz")
sha256sums=('5ab1e5b0472550f9037a8800834f6bc3b927690070f69fac0b67284b4b05fd5f')

prepare() {
  cd "$srcdir/libpfm-$pkgver"
  sed -i 's|PREFIX=/usr/local|PREFIX=/usr|g' config.mk
  sed -i 's|LDCONFIG=ldconfig|LDCONFIG=true|g' config.mk
}

build() {
  cd "$srcdir/libpfm-$pkgver"
  make
}

check () {
  cd "$srcdir/libpfm-$pkgver/tests"
  ./validate
}

package() {
  cd "$srcdir/libpfm-$pkgver"

  # Install libraries
  make DESTDIR="$pkgdir/" install

  # Install useful example files
  make DESTDIR="$pkgdir/" install_examples

  # Install license
  install -D -m0644 COPYING "${pkgdir}"/usr/share/licenses/libpfm4/LICENSE
}

# vim:set ts=2 sw=2 et:
