# Maintainer: xsmile <>
pkgname=ifrextractor-ls
pkgver=0.3.7
pkgrel=1
pkgdesc='Extracts the internal forms represenation from both EFI and UEFI modules'
arch=(any)
url='https://github.com/LongSoft/Universal-IFR-Extractor'
license=(GPL3)
makedepends=(cmake git)
provides=(ifrextractor)
conflicts=(ifrextractor)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('76b38c5ab7e23f732f1ed4ea9b6183fbf0d9bb5550a6be62326306b45c128b38')

build() {
  cmake -S Universal-IFR-Extractor-${pkgver} -B build \
    -DCMAKE_C_FLAGS:STRING="$CFLAGS" \
    -DCMAKE_CXX_FLAGS:STRING="$CXXFLAGS" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="$LDFLAGS"
  make -C build
}

package() {
  install -Dm755 build/ifrextract -t "$pkgdir"/usr/bin/
}
