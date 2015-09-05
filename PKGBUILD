# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=plasma-sdk-tools-git
pkgver=r1505.38373cf
pkgrel=1
pkgdesc='Applications useful for Plasma Development (except Plasmate)'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/plasma-sdk'
license=('LGPL')
depends=('plasma-framework' 'ktexteditor')
makedepends=('extra-cmake-modules' 'git')
conflicts=('plasmate-tools' 'plasmate' 'plasma-sdk' 'plasma-sdk-tools' 'kdebase-workspace<=4.9.80')
replaces=('plasmate-tools-frameworks-git' 'plasmate-tools-git')
source=('git://anongit.kde.org/plasma-sdk.git')
md5sums=('SKIP')

pkgver() {
  cd plasma-sdk
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../plasma-sdk \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF \
    -DPLASMATE_BUILD_WITH_KDEVPLATFORM=OFF
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
