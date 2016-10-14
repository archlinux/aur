# Maintainer: Luca Weiss <WEI16416 (at) spengergasse (dot) at>

pkgname=kde1-kdebase
pkgver=1.1.2
pkgrel=1
pkgdesc="Historical copy of the base applications module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://github.com/KDE/kde1-kdebase"
license=("GPL2")
depends=("qt1" "kde1-kdelibs" "libjpeg" "libtiff") # TODO : Fill
_commit="07492489711904daf165c633549883000a71295a"
source=("https://github.com/KDE/$pkgname/archive/$_commit.zip")
sha256sums=('8f2f84b941af1b018ae4a86d41e6ff3a7e952254cfae32bc959c797fe49ae128')

prepare() {
  cd $srcdir/$pkgname-$_commit
}

build() {
  cd $srcdir/$pkgname-$_commit
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_LIBRARY_PATH='/opt/kde1/lib64'
  make
}

package() {
  # TODO : Fix icons missing
  cd $srcdir/$pkgname-$_commit
  cd build
  make DESTDIR="$pkgdir/" install
  cd ..  
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
