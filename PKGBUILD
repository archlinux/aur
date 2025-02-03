#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="mylibrary"
pkgver="3.1"
pkgrel="1"
pkgdesc="Home librarian"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/mylibrary/archive/refs/tags/v3.1.tar.gz")
url="https://github.com/ProfessorNavigator/mylibrary"
license=('GPLv3')
makedepends=('cmake' 'pkgconf' 'gcc')
depends=('gtkmm-4.0' 'icu' 'libgcrypt' 'poppler' 'djvulibre' 'libarchive' 'onetbb')
sha256sums=('c76d1d5f2350c7a8820c57a8cc955ef590bf832a1320600a1c5d6d76a5c4b0f4')

build() {   
   mkdir -p $srcdir/builddir
   cd $srcdir/$pkgname-$pkgver   
   cmake -DCMAKE_BUILD_TYPE=release \
   -DCMAKE_INSTALL_PREFIX=/usr \
   -DUSE_OPENMP=ON \
   -DUSE_TBB=ON \
   -B$srcdir/builddir
   cd $srcdir/builddir
   make -j$(nproc)
}

package() {
    cd $srcdir/builddir
    DESTDIR=$pkgdir make install
}
