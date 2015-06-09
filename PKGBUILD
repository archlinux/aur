# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=lightdm-kde-greeter-git
pkgver=379.9f6784d
pkgrel=1
pkgdesc="LightDM Greeter for KDE"
arch=(i686 x86_64)
url="https://projects.kde.org/projects/playground/base/lightdm"
license=(GPL)
depends=(liblightdm-qt4 lightdm qt4 openssl perl phonon kdelibs)
makedepends=(git cmake automoc4)
provides=(lightdm-kde lightdm-kde-greeter lightdm-kde-git)
conflicts=(lightdm-kde lightdm-kde-greeter lightdm-kde-git)
source=('lightdm-kde::git+git://anongit.kde.org/lightdm')
sha512sums=('SKIP')

pkgver() {
  cd lightdm-kde
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd lightdm-kde

  mkdir -p build/
  cd build/
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package() {
  cd lightdm-kde/build
  make DESTDIR="${pkgdir}/" install
}
