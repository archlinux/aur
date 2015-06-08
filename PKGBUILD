# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kapidox-git
pkgver=r159.f7011be
pkgrel=1
pkgdesc='Frameworks API Documentation Tools'
arch=('any')
url='https://projects.kde.org/projects/frameworks/kapidox'
license=('LGPL')
depends=()
makedepends=('extra-cmake-modules-git' 'qt5-base' 'git' 'python')
optdepends=('python: for depdiagram-generate')
groups=('kf5')
conflicts=(kapidox)
provides=(kapidox)
source=('git://anongit.kde.org/kapidox.git')
md5sums=('SKIP')

pkgver() {
  cd kapidox
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kapidox \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
