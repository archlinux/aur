#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="communist"
pkgver="2.0.4"
pkgrel="1"
pkgdesc="Simple GTK4 based p2p messenger"
license=('GPL3')
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/communist/archive/refs/tags/v2.0.4.tar.gz")
url="https://github.com/ProfessorNavigator/communist"
makedepends=('meson' 'ninja' 'pkgconf' 'gcc' 'gtkmm-4.0' 'hunspell' 'icu' 'libcommunist')
depends=('gtkmm-4.0' 'hunspell' 'icu' 'gst-plugins-good' 'libcommunist')
sha256sums=('a55b71cb0b28e011c728ab39a307b4fcdb8fe24b1927dd83106c9ce2c5f98eef')
options=(strip)

build() {   
   mkdir -p $srcdir/builddir
   cd $srcdir/$pkgname-$pkgver
   meson setup -Dprefix=/usr -Dbuildtype=release $srcdir/builddir
   cd $srcdir/builddir
   ninja 
}

package() {
    cd $srcdir/builddir
    DESTDIR=$pkgdir ninja install
}
