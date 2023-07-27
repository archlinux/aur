# Maintainer:Bipin Kumar <kbipinkumar@pm.me>

pkgname=abpoa
_pkgname=abPOA
pkgver=1.4.1
pkgrel=2
pkgdesc='SIMD-based C library for fast partial order alignment. https://dx.doi.org/10.1093/bioinformatics/btaa963' 
arch=(x86_64)
url="https://github.com/yangao07/abPOA"
license=('MIT')
depends=('glibc' 
         'zlib')
makedepends=('cmake' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yangao07/abPOA/archive/refs/tags/v${pkgver}.tar.gz"
        )
b2sums=('854ee84d64b9428764eeb86029aa1e40241231c3366c6f6471a62eea0e3ca85a9490c914d6599c3907c8365c63e120e76fec6c6ee9cc97f4729d6252bc5a8de7')


build() {
  cd ${_pkgname}-${pkgver}
  cmake -B build \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_SKIP_INSTALL_RPATH=YES \
        -DCMAKE_INSTALL_INCLUDEDIR='include/${pkgname}' \
        -Wno-dev
    cmake --build build
}

check() {
    cd ${_pkgname}-${pkgver}/build
    ./bin/abpoa ../test_data/seq.fa > cons.fa
}

package() {
  cd ${_pkgname}-${pkgver}
  install -d 755 ${pkgdir}/usr
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
