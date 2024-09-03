# Maintainer: Daniel Poellmann <aur@<lastname><firstname>.de>

pkgname=libkeychain
pkgver=1.3.0
pkgrel=1
pkgdesc="Thin cross-platform wrapper to access the operating system's credential storage in C++."
arch=('x86_64')
url="https://github.com/hrantzsch/keychain"
license=('MIT')
depends=('libsecret')
makedepends=('cmake' 'git')
source=("$pkgname::git+https://github.com/hrantzsch/keychain.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  mkdir -p _build
  cmake . -DBUILD_TESTS=no -B _build
  cmake --build _build
}

package() {
  cd "$pkgname"
  install -Dm644 "$srcdir/libkeychain/include/keychain/keychain.h" "$pkgdir/usr/include/keychain/keychain.h"
  install -Dm644 "$srcdir/libkeychain/_build/libkeychain.a" "$pkgdir/usr/lib/libkeychain.a"
}
