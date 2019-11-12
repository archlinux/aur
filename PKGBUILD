# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=fatcat
pkgver=1.1.0
pkgrel=1
pkgdesc=" FAT filesystems explore, extract, repair, and forensic tool"
arch=('i686' 'x86_64')
url="https://github.com/Gregwar/fatcat"
license=('BSD')
depends=()
makedepends=('cmake')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/Gregwar/fatcat/archive/v${pkgver}.tar.gz")
sha256sums=('303efe2aa73cbfe6fbc5d8af346d0f2c70b3f996fc891e8859213a58b95ad88c')

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

