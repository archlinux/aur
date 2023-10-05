#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="mylibrary"
pkgver="2.2.2"
pkgrel="1"
pkgdesc="Home librarian"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/mylibrary/archive/refs/tags/v2.2.2.tar.gz")
url="https://github.com/ProfessorNavigator/mylibrary"
makedepends=('meson' 'pkgconf' 'gcc')
depends=('gtkmm-4.0' 'libzip' 'icu' 'libgcrypt' 'gmp' 'poppler' 'djvulibre' 'libarchive')
sha256sums=('5e41fb9b30e7f9a5b9d3c86ccd43f2629f296ab2206878d4a17ce26c3e723205')

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
