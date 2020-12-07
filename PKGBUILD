# Maintainer Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=boost-libs-171-opt
pkgver=1.71.0
pkgrel=1
pkgdesc='Free peer-reviewed portable C++ runtime libraries (installs to /opt, without numpy & python support)'
url='https://www.boost.org'
arch=('x86_64')
license=('custom')
depends=('bzip2' 'zlib' 'icu' 'zstd')
optdepends=('openmpi: for mpi support')
makedepends=('icu'
             'bzip2'
             'zlib'
             'openmpi'
             'zstd'
             'findutils')
source=("${pkgname}-${pkgver}.tar.gz::https://dl.bintray.com/boostorg/release/${pkgver}/source/boost_1_71_0.tar.gz")
sha256sums=('96b34f7468f26a141f6020efb813f1a2f3dfb9797ecf76a7d7cbd843cc95f5bd')

prepare() {
  cd "boost_1_71_0"
  ./bootstrap.sh
}

build() {
  cd "boost_1_71_0"
  ./b2
}

package() {
  cd "boost_1_71_0"
  install -d "${pkgdir}/opt/usr/include/"
  install -d "${pkgdir}/opt/usr/lib/"
  cp -r boost "${pkgdir}/opt/usr/include/"
  cp -r stage/lib/* "${pkgdir}/opt/usr/lib/"
  install -Dm644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim: ts=2 sw=2 et: