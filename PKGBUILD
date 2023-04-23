#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="libcommunist"
pkgver="1.0.3"
pkgrel="1"
pkgdesc="Library for P2P communications"
license=('GPL3')
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/libcommunist/archive/refs/tags/v1.0.3.tar.gz")
url="https://github.com/ProfessorNavigator/libcommunist"
makedepends=('meson' 'ninja' 'pkgconf' 'libtorrent-rasterbar' 'libgcrypt' 'libzip' 'boost')
depends=('libtorrent-rasterbar' 'libgcrypt' 'libzip')
sha256sums=('5949dd37069a7f910a06eb11ed22bd3813d984564d71df444fe0b439e15a242f')
options=(strip)

build() {   
   mkdir -p $srcdir/builddir
   cd $srcdir/$pkgname-$pkgver
   meson setup -Dprefix=/usr -Dlibdir=lib -Dbuildtype=release $srcdir/builddir
   cd $srcdir/builddir
   ninja 
}

package() {
    cd $srcdir/builddir
    DESTDIR=$pkgdir ninja install
}
