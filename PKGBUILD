# Maintainer: Arthur LAURENT <arthur.laurent4@gmail.com>

pkgname=qtcreator-xmake-project-manager
pkgver=8.0.0.r112.fd9eb70
pkgrel=1
pkgdesc='QtCreator XMake project support plugin'
arch=(x86_64)
url='https://github.com/Arthapz/xmake-project-manager'
license=(GPL3)
depends=(qtcreator)
makedepends=(qtcreator-devel cmake)
options=()
optdepends=()
source=(git+https://github.com/Arthapz/xmake-project-manager.git)
sha256sums=('SKIP')

pkgver() {
  cd 'xmake-project-manager' 
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "8.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


build() {
   cmake -B build -S xmake-project-manager \
	   -DCMAKE_INSTALL_PREFIX=/usr \
	   -DCMAKE_BUILD_TYPE=Release
   cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
