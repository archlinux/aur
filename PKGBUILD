# Maintainer: navigaid <navigaid@gmail.com>

pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=79.0.3945.79
pkgrel=1
arch=('x86_64' 'amd64' 'i386' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
makedepends=("clang" "lld" "ninja" "gn" "python2" "gcc" "llvm")
source=(
  "build.sh"
  "${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/klzgrad/naiveproxy/archive/v${pkgver}-${pkgrel}.tar.gz"
)
optdepends=("ccache: Speed up compilation")
backup=(etc/naiveproxy/config.json)
md5sums=('8e804bbdad8bbe1e929f284512207a8d'
         '4390b698cae1cb7d903759d0ede056d3')
provides=('naiveproxy')
conflicts=('naiveproxy-git' 'naiveproxy-bin')

build(){
  pushd ${srcdir}/${pkgname}-${pkgver}-${pkgrel}/src
  ../../build.sh
  popd
}

package(){
  pushd ${srcdir}/${pkgname}-${pkgver}-${pkgrel}
  install -Dm755 src/out/Release/naive ${pkgdir}/usr/bin/naiveproxy
  install -Dm644 src/config.json ${pkgdir}/etc/naiveproxy/config.json
  install -Dm644 README.md ${pkgdir}/usr/share/doc/naiveproxy/README.md
  install -Dm644 USAGE.txt ${pkgdir}/usr/share/doc/naiveproxy/USAGE.txt
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/naiveproxy/LICENSE
  popd
}
