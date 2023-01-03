#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="mylibrary"
pkgver="2.0"
pkgrel="2"
pkgdesc="Home librarian"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/mylibrary/archive/refs/tags/v2.0.tar.gz")
url="https://github.com/ProfessorNavigator/mylibrary"
makedepends=('meson' 'pkgconf' 'gcc')
depends=('gtkmm-4.0' 'libzip' 'icu' 'libgcrypt' 'gmp' 'poppler' 'djvulibre')
sha256sums=('1a1d9cdaac19ba10f25f6f70522409f825c33a2ccc863d6b4f1dd579681d45d3')

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
