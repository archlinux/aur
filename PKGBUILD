# Maintainer: Tajidin Abd <tajidinabd at archlinux dot us>
# Contributor: Antonio Rojas
# Contributor: Samuel Mesa

pkgname=qca-qt4
pkgver=2.1.3
pkgrel=1
pkgdesc="Qt Cryptographic Architecture. Qt4 Build (GIT Version)"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://download.kde.org/stable/qca/${pkgver}/src/qca-${pkgver}.tar.xz"
depends=('qt4' )
makedepends=('cmake' 'doxygen' 'git' 'botan' 'pkcs11-helper' 'libsasl' 'libgcrypt')
optdepends=('botan: Botan plugin'
            'pkcs11-helper: PKCS11 plugin'
            'nss: nss plugin'
            'libsasl: SASL plugin'
            'libgcrypt: gcrypt plugin')
conflicts=('qca-qt4')
provides=('qca-qt4')
source=("git://anongit.kde.org/qca.git")
md5sums=('SKIP')

prepare() {
  mkdir -p build
  sed 's|_BSD_SOURCE|_DEFAULT_SOURCE|g' -i qca/CMakeLists.txt
}

build() {
  cd build
  cmake ../qca \
    -DQT4_BUILD=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DQCA_INSTALL_IN_QT_PREFIX=ON \
    -DQCA_PLUGINS_INSTALL_DIR=/usr/lib/qt4/plugins  \
    -DQCA_SUFFIX=qt4 \
    -DBUILD_TESTS=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
