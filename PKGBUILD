# Maintainer: Curve <curve.platin at gmail.com>
pkgname=aawmtt
pkgver=r1.00c8a35
pkgrel=1
pkgdesc="Another AwesomeWM Testing Tool, with Live Reload and 'proper' display detection"
arch=('any')
url="https://github.com/Curve/aawmtt"
license=('MIT')
makedepends=('git' 'cmake' 'ninja')
conflicts=('aawmtt')
provides=('aawmtt')
source=("git+https://github.com/Curve/$pkgname")
sha256sums=('SKIP')

pkgver() {
        cd "$pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/$pkgname"
  mkdir -p build
  cd build
  cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
  ninja
}

package() {
  # install binary
  install -Dm 755 "${srcdir}/$pkgname/build/$pkgname" "${pkgdir}/usr/bin/$pkgname"
}
