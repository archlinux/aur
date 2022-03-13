# Maintainer: Curve <curve.platin at gmail.com>
pkgname=saucer-cli-git
_gitname=saucer-cli
pkgver=r7.4a6f1f8
pkgrel=2
pkgdesc="A cli program to simplify working with saucer"
arch=('any')
url="https://github.com/saucer/saucer-cli"
license=('MIT')
makedepends=('git' 'cmake' 'ninja')
conflicts=('saucer-cli')
provides=('saucer-cli')
source=("git+https://github.com/saucer/$_gitname")
sha256sums=('SKIP')

pkgver() {
        cd "$_gitname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

build() {
  cd "${srcdir}/$_gitname"
  mkdir -p build
  cd build
  cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
  ninja
}

package() {
  # install binary
  install -Dm 755 "${srcdir}/$_gitname/build/saucer" "${pkgdir}/usr/bin/saucer"
}
