# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributer: giacomogiorgianni@gmail.com

pkgname=httraqt-git
pkgver=1.4.10.4.gd3e085c
pkgrel=1
pkgdesc="Is the clone from WinHTTrack tool. GUI is based on Qt libraries. (GIT Version)"
arch=('x86_64')
url='http://qt-apps.org/content/show.php/HTTraQt?content=155711'
license=('GPL')
depends=('qt5-multimedia'
         'httrack>=3'
         )
makedepends=('git'
             'cmake'
              )
source=('httraqt::git://git.code.sf.net/p/httraqt/code')
sha256sums=('SKIP')

pkgver(){
  cd httraqt
  echo "$(git describe --long --tags | sed 's|httraqt-||'| tr - .)"
}

prepare() {
  mkdir -p build

  cd build
  cmake ../httraqt \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT5=ON

}

build() {
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
