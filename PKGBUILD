# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kolor-manager-git
pkgver=v1.0.2.22.ge335417
pkgrel=1
pkgdesc="Oyranos CMS cross desktop settings for the KDE system settings panel. (GIT version)"
arch=('i686' 'x86_64')
url='http://www.oyranos.org/kolormanager'
license=('BSD')
depends=('synnefo-git'
         'kconfigwidgets'
         )
makedepends=('extra-cmake-modules'
             'git'
             'python'
             )
provides=('kolor-manager')
conflicts=('kolor-manager')
source=('git://anongit.kde.org/kolor-manager.git'
        'COPYING'
        )
sha1sums=('SKIP'
          '37cb5e34ad08d853124a42d06e273b2c6f33fe4b'
          )

pkgver() {
  cd kolor-manager
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kolor-manager \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
