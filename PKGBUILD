# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: 

pkgname=qactus-git
pkgver=0.9.9.r311.g3fede1c
pkgrel=1
pkgdesc="A Qt-based OBS notifier application."
arch=('i686' 'x86_64')
url="https://github.com/javierllorente/qactus"
license=('GPL2' 'GPL3')
depends=('hicolor-icon-theme' 'qtkeychain')
makedepends=('git')
conflicts=('qactus')
provides=('qactus')
source=('git://github.com/javierllorente/qactus.git')
md5sums=('SKIP')

pkgver() {
  cd qactus
  version=$(grep 'VERSION =' src/defines.pri | awk '{print $3}')
  printf "%s.r%s.g%s" "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i "s/lib64/lib/g" qactus/src/qobs/qobs.pro
}

build() {
  cd qactus
  qmake-qt5 PREFIX=/usr qactus.pro
  make
}

package() {
  make -C qactus INSTALL_ROOT="${pkgdir}" install
}
