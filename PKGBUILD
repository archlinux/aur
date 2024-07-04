# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="udpreplay"
pkgver=1.1.0
pkgrel=1
pkgdesc="Replay UDP packets from a pcap file"
arch=('any')
url="https://github.com/rigtorp/${pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs' 'libpcap')
makedepends=('make' 'cmake>=3.5.0' 'gcc' 'libpcap')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('27ef2fc6d13e7dde7ec4f3ddc58e7c43daad047af968b10d6cb404746e02228b')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  [ -d "build" ] || mkdir "build"
}

build() {
  cd "${srcdir}/${_pkgsrc}/build"
  cmake ..
  make
}

# check() {
#  cd "${srcdir}/${_pkgsrc}/build"
#  make test
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
