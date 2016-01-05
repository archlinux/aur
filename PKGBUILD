# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Kosyak <ObKo@mail.ru>

pkgname=qextserialport
pkgver=1.2rc
pkgrel=6
pkgdesc="Cross-platform serial port class libary for Qt4 and Qt5."
arch=('i686' 'x86_64')
url='https://github.com/qextserialport/qextserialport'
license=('MIT')
depends=('qt5-base')
source=("qextserialport-${pkgver}.tar.gz::https://github.com/qextserialport/qextserialport/archive/${pkgver}.tar.gz")
sha1sums=('2cd3ec6771b056db1bdf471517f8e20e8a4ecff2')

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake-qt5 "../qextserialport-${pkgver}"
  make
}

package() {
  make -C build INSTALL_ROOT="${pkgdir}" install

  install -Dm644 "qextserialport-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/qextserialport/LICENSE"

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;
}
