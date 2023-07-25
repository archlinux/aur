pkgname=epanet
pkgver=2.2
pkgrel=3
pkgdesc='The Water Distribution System Hydraulic and Water Quality Analysis Toolkit'
arch=('any')
url='https://github.com/OpenWaterAnalytics/EPANET'
license=('MIT')
makedepends=('cmake')
checkdepends=('boost')
optdepends=('python: Python wrapper')
source=("https://github.com/OpenWaterAnalytics/EPANET/archive/refs/tags/v${pkgver}.zip")
md5sums=('c89a5d4e46205017afd2598e7ec48e49')

build() {
    cd EPANET-$pkgver
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make -j2
}

package() {
    cd EPANET-$pkgver
    install -Dm644 build/bin/runepanet -t "$pkgdir/usr/bin"
    install -Dm644 build/lib/libepanet2.so -t "$pkgdir/usr/lib"
    install -Dm644 build/lib/libepanet-output.so -t "$pkgdir/usr/lib"
    install -Dm644 include/epanet2.h -t "$pkgdir/usr/include"
    install -Dm644 include/epanet2_2.h -t "$pkgdir/usr/include"
    install -Dm644 include/epanet2_enums.h -t "$pkgdir/usr/include"
    install -Dm644 include/epanet2.pas -t "$pkgdir/usr/include"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
