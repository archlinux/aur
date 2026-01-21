# Maintainer: Antigravity <antigravity@google.com>
pkgname=cuda-api-wrappers-git
_pkgname=cuda-api-wrappers
pkgver=v0.8.1.r1.g68a22e2
pkgrel=1
pkgdesc="Thin, unified, C++-flavored wrappers for the CUDA APIs"
arch=('x86_64')
url="https://github.com/eyalroz/cuda-api-wrappers"
license=('BSD')
depends=('cuda')
makedepends=('git' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/eyalroz/cuda-api-wrappers.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
