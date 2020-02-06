# Maintainer: Timothy Gu <timothygu99@gmail.com>

pkgname=pam_wrapper
pkgver=1.0.7
pkgrel=1
pkgdesc='A helper library for PAM testing'
arch=(x86_64)
url='https://cwrap.org/pam_wrapper.html'
license=('GPL3')
groups=(cwrap)
depends=(pam)
makedepends=(cmake python python2)
checkdepends=(cmocka)
optdepends=('python: Python 3 support'
            'python2: Python 2 support')
source=("https://ftp.samba.org/pub/cwrap/$pkgname-$pkgver.tar.gz")
sha256sums=('0537302eb6ceb07bcf5233c859b19264375beaa294bb3a9b7f58973981c8b219')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DUNIT_TESTING=TRUE
  make
}

check() {
  cd build
  make -k test
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
