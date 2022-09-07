#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="libcommunist"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="Library for P2P communications"
license=('GPL3')
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/libcommunist/archive/refs/tags/v1.0.1.tar.gz")
url="https://github.com/ProfessorNavigator/libcommunist"
makedepends=('meson' 'ninja' 'pkgconf' 'libtorrent-rasterbar' 'libgcrypt' 'libzip')
depends=('libtorrent-rasterbar' 'libgcrypt' 'libzip')
sha256sums=('7fb90f662299b19416c13a4f714539efbc3f5c6d5ac72acf2a69f1b10dc244ec')
options=(strip)

build() {   
   mkdir -p $srcdir/builddir
   cd $srcdir/$pkgname-$pkgver
   meson -Dprefix=/usr -Dlibdir=lib -Dbuildtype=release $srcdir/builddir
   cd $srcdir/builddir
   ninja 
}

package() {
    cd $srcdir/builddir
    DESTDIR=$pkgdir ninja install
}
