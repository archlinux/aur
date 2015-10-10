# Maintainer: Tajidin Abd <tajidinabd at archlinux dot us>
# Contributor: Antonio Rojas

pkgname=qca-qt5-git
pkgver=v2.1.0.35.g4f966b0
pkgrel=1
pkgdesc="Qt Cryptographic Architecture. Qt5 Build (GIT Version)"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://delta.affinix.com/qca/"
depends=('qt5-base' )
makedepends=('cmake' 'doxygen' 'git' 'botan-1.10' 'pkcs11-helper' 'libsasl' 'libgcrypt')
optdepends=('botan-1.10: Botan plugin'
            'pkcs11-helper: PKCS11 plugin'
            'nss: nss plugin'
            'libsasl: SASL plugin'
            'libgcrypt: gcrypt plugin')
conflicts=('qca-qt5')
provides=('qca-qt5')
source=("git://anongit.kde.org/qca.git#branch=qt5")
md5sums=('SKIP')

pkgver() {
  cd qca
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
  sed 's|_BSD_SOURCE|_DEFAULT_SOURCE|g' -i qca/CMakeLists.txt
}

build() {
  cd build
  cmake ../qca \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DQCA_INSTALL_IN_QT_PREFIX=ON \
    -DQCA_SUFFIX=qt5 \
    -DBUILD_TESTS=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
