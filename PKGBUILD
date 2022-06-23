#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="communist"
pkgver="1.4"
pkgrel="1"
pkgdesc="Communist is a simple GTK4 based p2p messenger"
license=('GPL3')
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/communist/archive/refs/tags/v1.4.tar.gz")
makedepends=('meson' 'ninja' 'pkgconf' 'gcc' 'gtkmm-4.0' 'hunspell' 'libtorrent-rasterbar' 'libgcrypt' 'libzip' 'icu' 'boost')
depends=('gtkmm-4.0' 'hunspell' 'libtorrent-rasterbar' 'libgcrypt' 'libzip' 'icu' 'gst-plugins-good')
sha256sums=('34da64002df9ae6d046e96e1d06d53ab52d7c56c9d85b5191d92f3da706c6224')
options=(strip)

build() {   
   mkdir -p $srcdir/builddir
   cd $srcdir/$pkgname-$pkgver
   meson -Dprefix=/usr -Dbuildtype=release $srcdir/builddir
   cd $srcdir/builddir
   ninja 
}

package() {
    cd $srcdir/builddir
    DESTDIR=$pkgdir ninja install
}
