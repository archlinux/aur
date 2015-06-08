# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Maintainer: dryes <joswiseman@gmail>

pkgname=aften-git
pkgver=0.0.8.r886.89aee3d
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Audio encoder which generates compressed audio streams based on ATSC A/52 specification. (GIT Version)'
url='http://aften.sourceforge.net/'
license=('GPL')
depends=('glibc')
makedepends=('cmake' 'git')
provides=('aften')
conflicts=('aften')
source=('aften::git://git.code.sf.net/p/aften/code')
sha1sums=('SKIP')

pkgver() {
  cd aften
  _ver="$(cat CMakeLists.txt | grep -e SO_MAJOR_VERSION -e SO_MINOR_VERSION -e SO_BUILD_VERSION | cut -d '"' -f2 | head -n3)"
  echo "$(echo ${_ver} | tr ' ' .).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../aften \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSHARED=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
