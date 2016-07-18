# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=flatbuffers-git
pkgver=r794.a69b19f
pkgrel=1
pkgdesc='An efficient cross platform serialization library for C++, with support for Java, C# and Go (git)'
arch=('i686' 'x86_64')
url='http://google.github.io/flatbuffers/'
license=('GPL')
makedepends=('cmake' 'git')
optdepends=('go' 'java-environment' 'mono')
conflicts=(flatbuffers)
provides=(flatbuffers)
source=("git+https://github.com/google/flatbuffers.git")
sha256sums=('SKIP')

pkgver() {
  cd flatbuffers
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../flatbuffers \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

check() {
        cd build
        make test
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
