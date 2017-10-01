# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=kde1-kdebase
pkgver=1.1.2
pkgrel=5
pkgdesc="Historical copy of the base applications module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://github.com/KDE/kde1-kdebase"
license=("GPL2")
groups=("kde1")
depends=("qt1" "kde1-kdelibs" "libjpeg" "libtiff" "perl")
makedepends=("cmake")
_commit="444ba45c273384ddbb4257027bdd60ec09fda13e"
source=("https://github.com/KDE/$pkgname/archive/$_commit.tar.gz" 0001-kcmikbd-also-needs-the-moc-files.patch)
sha256sums=('ff402fb14d1befb606c98a28a1bfe710a290dcf5ffa89849b61607eefc8ef4bf'
            'dbb7fa69167c6f8f175793ae0be445450a89a941562a641f462ae518b89135a8')

prepare() {
  cd $srcdir/$pkgname-$_commit
  patch -Np1 < $srcdir/0001-kcmikbd-also-needs-the-moc-files.patch
}

build() {
  cd $srcdir/$pkgname-$_commit
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_LIBRARY_PATH='/opt/kde1/lib'
  make
}

package() {
  cd $srcdir/$pkgname-$_commit
  cd build
  make DESTDIR="$pkgdir/" install
  cd ..  
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
