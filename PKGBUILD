#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="mylibrary"
pkgver="2.2"
pkgrel="1"
pkgdesc="Home librarian"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/mylibrary/archive/refs/tags/v2.2.tar.gz")
url="https://github.com/ProfessorNavigator/mylibrary"
makedepends=('meson' 'pkgconf' 'gcc')
depends=('gtkmm-4.0' 'libzip' 'icu' 'libgcrypt' 'gmp' 'poppler' 'djvulibre' 'libarchive')
sha256sums=('3bffb5f67d5524ca0f1531018fcb2735492cfd1c5753d2b90f4d3a6b5d6521b0')

build() {   
   mkdir -p $srcdir/builddir
   cd $srcdir/$pkgname-$pkgver   
   meson setup -Dbuildtype=release -Dprefix=/usr $srcdir/builddir
   cd $srcdir/builddir
   ninja      
}

package() {
    cd $srcdir/builddir
    DESTDIR=$pkgdir ninja install        
}
