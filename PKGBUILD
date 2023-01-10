#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="mylibrary"
pkgver="2.0.3"
pkgrel="1"
pkgdesc="Home librarian"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/mylibrary/archive/refs/tags/v2.0.3.tar.gz")
url="https://github.com/ProfessorNavigator/mylibrary"
makedepends=('meson' 'pkgconf' 'gcc')
depends=('gtkmm-4.0' 'libzip' 'icu' 'libgcrypt' 'gmp' 'poppler' 'djvulibre')
sha256sums=('5d67737983966a5e36f1898fd79f82f2a7cb6bab0337aa65582eea62878f3166')

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
