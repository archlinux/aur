# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kinit
pkgver=5.40.0
pkgrel=1
pkgdesc='Process launcher to speed up launching KDE applications'
arch=('x86_64')
url='https://community.kde.org/Frameworks'
license=('LGPL')
depends=('kio')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
groups=('kf5')
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('ca97eb8480a7387537166831a6a91892068656a161b9726429af581a436e2689'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
