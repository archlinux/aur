# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>

pkgname=mini18n-git
pkgver=0.2.1.r3261.b77edc86
pkgrel=2
pkgdesc="A a small and non-intrusive translation library designed for small memory and non-GNU systems. (GIT version)"
arch=('x86_64')
url='http://wiki.yabause.org/index.php5?title=Mini18n'
license=('GPL')
depends=('glibc')
makedepends=('git'
             'cmake'
             )
conficts=('mini18n')
provides=('mini18n'
          'libmini18n.so'
          )
source=('git+https://github.com/Guillaumito/yabause.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd yabause/mini18n
  _ver="$(cat CMakeLists.txt | grep -m3 "MINI18N_VERSION_" | sed 's|MINI18|MINI|g' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cmake -S yabause/mini18n -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
}
