# Maintainer: Jeremy Nobel <jeremynobel16@gmail.com>
pkgname=kls
pkgver=0.1.1
pkgrel=1
pkgdesc="A security-focused directory listing tool"
arch=('x86_64')
url="https://github.com/NobelC/kls"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake')
source=("git+https://github.com/NobelC/kls.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cmake -B build -S "$srcdir" \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_SANITIZERS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
