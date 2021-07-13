# Maintainer: delitako <delitako at delitako dot xyz>

pkgname=quicklisp-bootstrap
pkgver=2015_01_28
pkgrel=1
pkgdesc='Bootstrap script for the quicklisp package manager'
arch=('any')
url='https://www.quicklisp.org'
license=('MIT')
provides=('quicklisp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/quicklisp/quicklisp-bootstrap/archive/refs/tags/version-${pkgver//_/-}.tar.gz")
sha256sums=('92aef100970de4e64b102be1f08de1c9a9e8f22d6711f6aad217ffb6d16fc82f')

prepare() {
  mv quicklisp-bootstrap-version-${pkgver//_/-} $pkgname-$pkgver
}

build() {
  # Create the executable that outputs the location of the quicklisp bootstrap code
  echo "#!/bin/sh" > path.sh
  echo "echo '/usr/share/$pkgname/quicklisp.lisp'" >> path.sh
}

package() {
  install -Dm755 path.sh "$pkgdir/usr/bin/$pkgname"
  cd $pkgname-$pkgver
  install -Dm644 quicklisp.lisp "$pkgdir/usr/share/$pkgname/quicklisp.lisp"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
