# Maintainer: a821 at (nospam) mail de
# Contributor: mwberry <matt@comp.uter.science>

pkgname=re2c-git
pkgver=4.4.r7.gg55802e3b4
pkgrel=1
pkgdesc='Lexer generator for C, C++, D, Go, Haskell, Java, JS, OCaml, Python, Rust, V and Zig'
arch=(x86_64)
url='https://re2c.org'
license=('LicenseRef-re2c')
depends=('libgcc' 'libstdc++' 'glibc')
makedepends=('git' 'python' 'cmake')
source=(git+https://github.com/skvadrik/re2c)
sha1sums=('SKIP')
provides=('re2c')
conflicts=('re2c')

pkgver() {
  cd "re2c"
  git describe --long --tags | sed 's/-/.r/;s/-/.g/'
}

build() {
  cmake -S re2c -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "re2c/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
