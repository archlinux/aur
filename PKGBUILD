# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>

pkgname=mini18n-git
pkgver=0.2.1.r2406.e538b8c
pkgrel=1
pkgdesc="A a small and non-intrusive translation library designed for small memory and non-GNU systems. (GIT version)"
arch=('x86_64' 'i386')
url="http://wiki.yabause.org/index.php5?title=Mini18n"
license=('GPL')
depends=('glibc')
makedepends=('git' 'cmake')
conficts=('mini18n')
provides=('mini18n')
source=("git+https://github.com/Guillaumito/yabause.git")
sha1sums=('SKIP')

pkgver() {
  cd yabause/mini18n
  _ver="$(cat CMakeLists.txt | grep -e MINI18N_VERSION_MAJOR -e MINI18N_VERSION_MINOR -e MINI18N_VERSION_PATCH | head -n3 | cut -d ' ' -f2 | tr -d ')')"
  echo "$(echo ${_ver} | tr ' ' .).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
