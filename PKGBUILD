# Maintainer: navigaid <navigaid@gmail.com>

pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=76.0.3809.87
pkgrel=2
arch=('x86_64')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
makedepends=('git' 'ninja' 'cmake')
source=("${pkgname}.tar.gz::https://github.com/btwiuse/naiveproxy/archive/v${pkgver}-${pkgrel}.tar.gz")

build(){
  pushd ${srcdir}/${pkgname}-${pkgver}-${pkgrel}
  ./tools/import-upstream.sh
  ( cd src; ./get-clang.sh )
  ( cd src; ./build.sh )
  popd
}

check(){
  pushd ${srcdir}/${pkgname}-${pkgver}-${pkgrel}
  # ./tests/basic.sh src/out/Release/naive
  popd
}

package(){
  pushd ${srcdir}/${pkgname}-${pkgver}-${pkgrel}
  install -Dm755 src/out/Release/naive ${pkgdir}/usr/bin/naiveproxy
  install -Dm644 src/config.json ${pkgdir}/etc/naiveproxy/config.json
  install -Dm644 README.md ${pkgdir}/usr/share/doc/naiveproxy/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/naiveproxy/LICENSE
  popd
}
