#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="libcommunist"
pkgver="1.0"
pkgrel="1"
pkgdesc="Library for P2P communications"
license=('GPL3')
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/libcommunist/archive/refs/tags/v1.0.tar.gz")
url="https://github.com/ProfessorNavigator/libcommunist"
makedepends=('meson' 'ninja' 'pkgconf' 'libtorrent-rasterbar' 'libgcrypt' 'libzip')
depends=('libtorrent-rasterbar' 'libgcrypt' 'libzip')
sha256sums=('a6174d9b054e7d842cf23ecb6846ae8b34f1631ec377939b524332a485ec50b4')
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
