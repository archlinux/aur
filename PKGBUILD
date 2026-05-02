# Maintainer: Paul Maillard <pmaillard27@proton.me>
pkgname=zc-git
_pkgname=ZC
pkgver=1.0.r0.g8a2b3c4
pkgrel=1
pkgdesc="A C/C++ build tool and package manager"
arch=('x86_64')
url="https://github.com/Paul272007/ZC"
license=('MIT')
depends=('clang' 'llvm' 'libarchive' 'curl' 'openssl' 'nlohmann-json')
makedepends=('cmake' 'git')
provides=('zc')
conflicts=('zc')
source=("git+${url}.git#branch=stable")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_DEBUG=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/etc/completions/_zc" "$pkgdir/usr/share/zsh/site-functions/_zc"
}
