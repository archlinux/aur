# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=fatcat
pkgver=1.1.1
pkgrel=1
pkgdesc=" FAT filesystems explore, extract, repair, and forensic tool"
arch=('i686' 'x86_64')
url="https://github.com/Gregwar/fatcat"
license=('BSD')
makedepends=('cmake')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/Gregwar/fatcat/archive/v${pkgver}.tar.gz")
sha256sums=('5574f715f62a9feda7fffc8099f8bca7134ff4f1274bb1bc0db96a2969eea206')

build() {
  cd ${pkgname}-${pkgver}
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" prefix=/usr install
  cd ..
  mkdir -p ${pkgdir}/usr/share/fatcat/

  # install man page
  install -Dm644 man/fatcat.1 "${pkgdir}/usr/share/man/man1/fatcat.1"
  # install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/fatcat/LICENSE"
  # copy source code
  cp -r src ${pkgdir}/usr/share/fatcat/src
  # copy other docs
  cp -r docs ${pkgdir}/usr/share/fatcat/docs
}

