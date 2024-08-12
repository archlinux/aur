# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="git-tui"
pkgver=1.2.0
pkgrel=1
pkgdesc="Collection of human friendly terminal interface for git"
arch=('any')
url="https://github.com/ArthurSonzogni/${pkgname}"
license=('MIT')
makedepends=('cmake>=3.15' 'ftxui>=5.0.0' 'subprocess>=0.4.0')
depends=('glibc' 'gcc-libs' 'git')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('51fc9f55846fddb544f247e4154970c75d794a8523b240a914018eb59143bb91')

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
