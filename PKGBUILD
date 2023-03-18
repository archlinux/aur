# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributer: giacomogiorgianni@gmail.com

pkgname=httraqt-git
pkgver=1.4.11.1.ga117556
pkgrel=1
pkgdesc="Is the clone from WinHTTrack tool. GUI is based on Qt libraries. (GIT Version)"
arch=('x86_64')
url='https://httraqt.sourceforge.net'
license=('GPL')
depends=('qt6-multimedia'
         'httrack>=3'
         )
makedepends=('git'
             'cmake'
             'qt6-tools'
              )
source=('httraqt::git://git.code.sf.net/p/httraqt/code')
sha256sums=('SKIP')

pkgver(){
  cd httraqt
  echo "$(git describe --long --tags | sed 's|httraqt-||'| tr - .)"
}

build() {
  cmake -S httraqt -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT_VERSION=6

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
