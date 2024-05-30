# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=codequery
pkgver=1.0.0
pkgrel=1
pkgdesc="A code-understanding, code-browsing or code-search tool"
arch=('x86_64')
url="http://ruben2020.github.io/codequery"
license=('MPL-2.0')
depends=('gcc-libs' 'glibc' 'qt6-5compat' 'qt6-base' 'sqlite')
makedepends=('cmake' 'ninja' 'qt6-tools')
optdepends=('cscope: to create CodeQuery databases'
            'ctags: to create CodeQuery databases')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ruben2020/codequery/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('b0776adeae2963f197e3b9a57eb7ca405542da5f6413e06063e8d68f8246baa8'
            '1448fb7690e6b33cee50dffa8dc89654eba96e5910ae731b1b1486c46d72922a')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${pkgname}-${pkgver}/gui/images/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
