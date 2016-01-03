# Contributer: giacomogiorgianni@gmail.com 

pkgname=httraqt-git
pkgver=1.4.7.34.r328.33b1852
pkgrel=1
pkgdesc="Is the clone from WinHTTrack tool. GUI is based on Qt libriaries. (GIT Version)"
arch=('i686' 'x86_64')
url='http://qt-apps.org/content/show.php/HTTraQt?content=155711'
license=('GPL')
depends=('qt5-multimedia'
         'httrack>=3'
         )
makedepends=('git'
             'cmake'
              )
source=('httraqt::git://git.code.sf.net/p/httraqt/code')
sha1sums=('SKIP')
install=httraqt-git.install

pkgver(){
  cd httraqt
  _ver="$(cat README | grep -E "^[0-9]+\\.[0-9]+\\.[0-9]+" | head -n 1 | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  sed 's|USE_QT_VERSION 4|USE_QT_VERSION 5|g' -i httraqt/CMakeLists.txt
}

build() {
  cd build
  cmake ../httraqt \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
