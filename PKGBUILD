#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="mylibrary"
pkgver="1.0"
pkgrel="1"
pkgdesc="Home librarian"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/mylibrary/archive/refs/tags/v1.0.tar.gz")
url="https://github.com/ProfessorNavigator/mylibrary"
makedepends=('meson' 'pkgconf' 'gcc')
depends=('gtkmm-4.0' 'libzip' 'icu' 'libgcrypt')
sha256sums=('b00e25d4c98fedc1f4c9dac3daf5ad25b391d35cbe9d9b11652bc6481fd5123f')

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
