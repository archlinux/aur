# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=psvimgtools-git
pkgver=0.1.3.gf446c56
pkgrel=1
arch=('x86_64')
pkgdesc="Decrypt Vita CMA backups. (GIT version)"
url='https://github.com/yifanlu/psvimgtools'
license=('MIT')
depends=(
  'glibc' # libc.so
  'libgcrypt' # libgcrypt.so
  'zlib' 'libz.so'
)
makedepends=(
  'git'
  'cmake'
)
conflicts=('psvimgtools')
provides=('psvimgtools')
source=('git+https://github.com/yifanlu/psvimgtools.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd psvimgtools
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  cmake -S psvimgtools -B build \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 psvimgtools/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
