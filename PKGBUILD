# Maintainer:  Askhat Bakarov <sirocco{at}ngs{dot}ru>

pkgname=android-file-transfer-linux-git
_pkgname="${pkgname/-git/}"
_gitbranch=master
_gitauthor=whoozle
pkgver=v2.3.r0.g7d44664
pkgrel=1
pkgdesc="An interactive MTP client implemented in C++ using Qt toolkit"
arch=('i686' 'x86_64')
url="https://github.com/whoozle/android-file-transfer-linux"
license=(GPL2)
depends=('qt5-base' 'fuse' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('cmake' 'git' 'ninja')
install=$pkgname.install
source=("git://github.com/$_gitauthor/$_pkgname.git#branch=$_gitbranch")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

prepare() {
  cd "$_pkgname"
  mkdir -p build
}



build() {
  cd "$_pkgname"
  
  cd build

  cmake -G Ninja .. \
    -DCMAKE_INSTALL_PREFIX=/usr

  ninja
}

package() {
  cd "$_pkgname"/build

  DESTDIR="$pkgdir" ninja install

  install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}


