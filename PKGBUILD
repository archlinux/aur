# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kolor-manager-git
pkgver=1.1.0.21.g246e3f1
pkgrel=1
pkgdesc="Oyranos CMS cross desktop settings for the KDE system settings panel. (GIT version)"
arch=('i686' 'x86_64')
url='http://www.oyranos.org/kolormanager'
license=('BSD')
depends=('synnefo-git'
         'kconfigwidgets'
         'kdesignerplugin'
         )
makedepends=('extra-cmake-modules'
             'git'
             'python'
             )
provides=('kolor-manager')
conflicts=('kolor-manager')
optdepends=('icc_examin: view ICC profiles')
source=('git://anongit.kde.org/kolor-manager.git'
        'COPYING'
        )
sha256sums=('SKIP'
            '0bf075f1e7006a49c5e6d18e9339409dc3f88334992a539794067fa3b8973a9a'
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
