# Maintainer: Jeremy Nobel <jeremynobel16@gmail.com>
pkgname=kls
pkgver=0.1.1
pkgrel=2
pkgdesc="A security-focused directory listing tool"
arch=('x86_64')
url="https://github.com/NobelC/kls"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake')
source=("git+https://github.com/NobelC/kls.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_SANITIZERS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
