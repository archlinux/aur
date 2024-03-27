# Maintainer:
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=codequery
pkgver=0.27.0
pkgrel=1
pkgdesc="A code-understanding, code-browsing or code-search tool"
arch=('x86_64')
url="http://ruben2020.github.io/codequery/"
license=('MPL-2.0')
depends=('gcc-libs' 'glibc' 'qt5-base' 'sqlite')
makedepends=('cmake' 'qt5-tools' 'ninja')
optdepends=('cscope: to create CodeQuery databases'
            'ctags: to create CodeQuery databases')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ruben2020/codequery/archive/v${pkgver}.tar.gz"
        'codequery.desktop')
sha256sums=('c03b86f9f5a8f5373862efaef6bddd18a15e5786570a93f0310725ecc5d74ff3'
            '1448fb7690e6b33cee50dffa8dc89654eba96e5910ae731b1b1486c46d72922a')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_QT5=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 -t "${pkgdir}/usr/share/applications" codequery.desktop
  install -Dm644 "${pkgname}-${pkgver}/gui/images/logo.png" "${pkgdir}/usr/share/pixmaps/codequery.png"
}
