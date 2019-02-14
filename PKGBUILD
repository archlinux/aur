# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=fatcat
pkgver=1.0.6
pkgrel=1
pkgdesc=" FAT filesystems explore, extract, repair, and forensic tool"
arch=('i686' 'x86_64')
url="https://github.com/Gregwar/fatcat"
license=('BSD')
depends=()
makedepends=('cmake')
source=("https://github.com/Gregwar/fatcat/archive/${pkgver}.tar.gz")
sha256sums=('d44f6bb80d20ed50095ace9e71df8da98037db9f22cda76bdd9724d37df69130')

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
  gzip -1 ${pkgdir}/usr/share/man/man1/fatcat.1
  # install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/fatcat/LICENSE"
  # copy source code
  cp -r src ${pkgdir}/usr/share/fatcat/src
  # copy other docs
  cp -r docs ${pkgdir}/usr/share/fatcat/docs
}

