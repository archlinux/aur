pkgname=epanet-git
pkgver=2.2.r1057.2825f96
pkgrel=1
pkgdesc='The Water Distribution System Hydraulic and Water Quality Analysis Toolkit'
arch=('any')
url='https://github.com/OpenWaterAnalytics/EPANET'
license=('MIT')
provides=('epanet')
conflicts=('epanet')
depends=('cmake')
checkdepends=('boost')
optdepends=('python: Python wrapper')
source=("${pkgname}::git+https://github.com/OpenWaterAnalytics/EPANET.git#branch=dev")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  tag='v2.2'
  printf "%s.r%s.%s" "${tag#v}" "$(git rev-list --count ${tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make -j2
}

package() {
    cd $pkgname
    install -Dm644 build/bin/runepanet -t "$pkgdir/usr/bin"
    install -Dm644 build/lib/libepanet2.so -t "$pkgdir/usr/lib"
    install -Dm644 build/lib/libepanet-output.so -t "$pkgdir/usr/lib"
    install -Dm644 include/epanet2.h -t "$pkgdir/usr/include"
    install -Dm644 include/epanet2_2.h -t "$pkgdir/usr/include"
    install -Dm644 include/epanet2_enums.h -t "$pkgdir/usr/include"
    install -Dm644 include/epanet2.pas -t "$pkgdir/usr/include"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
