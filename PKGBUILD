# Maintainer: 0tkl

pkgname=epanet
pkgver=2.2
pkgrel=4
pkgdesc='The Water Distribution System Hydraulic and Water Quality Analysis Toolkit'
arch=(x86_64)
url='https://github.com/OpenWaterAnalytics/EPANET'
license=(MIT)
makedepends=(cmake)
checkdepends=(boost)
optdepends=('python: Python wrapper')
source=("$pkgname-v${pkgver}.zip::https://github.com/OpenWaterAnalytics/EPANET/archive/refs/tags/v${pkgver}.zip")
md5sums=('c89a5d4e46205017afd2598e7ec48e49')

build() {
  cd EPANET-$pkgver
  mkdir build
  cd build
  cmake -DBUILD_TESTS=ON ..
  cmake --build . --config Release
}

check() {
  cd EPANET-$pkgver/build/tests
  ctest -C Release --output-on-failure
}

package() {
  cd EPANET-$pkgver
  # install -Dm644 build/bin/runepanet -t "$pkgdir/usr/bin"
  install -Dm644 build/lib/libepanet2.so -t "$pkgdir/usr/lib"
  install -Dm644 build/lib/libepanet-output.so -t "$pkgdir/usr/lib"
  install -Dm644 include/epanet2.h -t "$pkgdir/usr/include"
  install -Dm644 include/epanet2_2.h -t "$pkgdir/usr/include"
  install -Dm644 include/epanet2_enums.h -t "$pkgdir/usr/include"
  install -Dm644 include/epanet2.pas -t "$pkgdir/usr/include"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
