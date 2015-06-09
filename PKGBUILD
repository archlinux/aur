pkgname=purpose
pkgver=0.1
_pkgver=0.1-alpha
pkgrel=1
pkgdesc="Framework for providing abstractions to get the developer's purposes fulfilled"
arch=('x86_64')
url='https://projects.kde.org/purpose'
license=('LGPL')
depends=('kaccounts-integration')
makedepends=('extra-cmake-modules' 'python')
source=("http://download.kde.org/unstable/purpose/purpose-$_pkgver.tar.xz"
        'accounts.diff')
md5sums=('ccb8ae820b4ed9b76bc7aca4cb5eba0a'
         'c00351fb0b7a666509db6ccef803d489')

prepare() {
  cd $pkgname-$_pkgver
  patch -p1 -i $srcdir/accounts.diff
}

build() {
  mkdir -p build
  cd build
  
  cmake ../$pkgname-$_pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build

  make DESTDIR=$pkgdir install
}

