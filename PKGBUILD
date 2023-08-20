# Maintainer: Omer Furkan Demircioglu <oflifurkan@gmail.com>
_pkgbase=rustypaste-qt
pkgname="$_pkgbase-git"
pkgver=0.1.0.1.g8404fb0  # Update this to your project version
pkgrel=1
pkgdesc="RustyPaste QT Client"  # Update this with a brief description of your project
arch=('x86_64')
url="https://github.com/oflifurkan/rustypaste-qt"
license=('GPL3')  # Update this to your project's license
depends=('qt6-base')
makedepends=(cmake git)
source=("$_pkgbase::git+$url.git")
md5sums=('SKIP')  # Because we are using a git repo, we'll skip the checksum

pkgver() {
  cd $srcdir/$_pkgbase
  git describe --tags --long | sed 's/^v//;s/-/./g'
}


build() {
  cd $srcdir/$_pkgbase
  
  mkdir -p build 
  cd build

  cmake .. -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  
  make -j$(nproc)
}

package() {
  cd $srcdir/$_pkgbase/build 

  make DESTDIR="$pkgdir/" install
}

