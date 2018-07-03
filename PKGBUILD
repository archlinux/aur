# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=psvimgtools-git
pkgver=v0.1.3.gf446c56
pkgrel=1
arch=('x86_64')
pkgdesc="Decrypt Vita CMA backups. (GIT version)"
url='https://github.com/yifanlu/psvimgtools'
license=('MIT')
depends=('libgcrypt'
         'zlib'
         )
makedepends=('git'
             'cmake'
             )
conflicts=('psvimgtools')
provides=('psvimgtools')
source=('git+https://github.com/yifanlu/psvimgtools.git')
sha256sums=('SKIP')

pkgver() {
  cd psvimgtools
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd build
  cmake ../psvimgtools \
    -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 psvimgtools/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
