# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>

pkgname=mini18n-git
pkgver=0.2.1.r3158.e78c886
pkgrel=1
pkgdesc="A a small and non-intrusive translation library designed for small memory and non-GNU systems. (GIT version)"
arch=('x86_64' 'i386')
url='http://wiki.yabause.org/index.php5?title=Mini18n'
license=('GPL')
depends=('glibc')
makedepends=('git'
             'cmake'
             )
conficts=('mini18n')
provides=('mini18n')
source=("git+https://github.com/Guillaumito/yabause.git")
sha1sums=('SKIP')

pkgver() {
  cd yabause/mini18n
  _ver="$(cat CMakeLists.txt | grep -m3 "MINI18N_VERSION_" | sed 's|MINI18|MINI|g' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../yabause/mini18n \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
