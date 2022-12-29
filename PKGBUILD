#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="libcommunist"
pkgver="1.0.2"
pkgrel="1"
pkgdesc="Library for P2P communications"
license=('GPL3')
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/libcommunist/archive/refs/tags/v1.0.2.tar.gz")
url="https://github.com/ProfessorNavigator/libcommunist"
makedepends=('meson' 'ninja' 'pkgconf' 'libtorrent-rasterbar' 'libgcrypt' 'libzip' 'boost')
depends=('libtorrent-rasterbar' 'libgcrypt' 'libzip')
sha256sums=('e4dcd7b99a63d04894b45c33923353f293543712e97e859b8f26ff4a3d474635')
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
