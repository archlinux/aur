#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="communist"
pkgver="2.0.3"
pkgrel="3"
pkgdesc="Simple GTK4 based p2p messenger"
license=('GPL3')
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/communist/archive/refs/tags/v2.0.3.tar.gz")
url="https://github.com/ProfessorNavigator/communist"
makedepends=('meson' 'ninja' 'pkgconf' 'gcc' 'gtkmm-4.0' 'hunspell' 'icu' 'libcommunist')
depends=('gtkmm-4.0' 'hunspell' 'icu' 'gst-plugins-good' 'libcommunist')
sha256sums=('5c8b7468a66f9e60ad7c70d0706dcb2c6ef22faac5c65299b6c32f558af49c77')
options=(strip)

build() {   
   mkdir -p $srcdir/builddir
   cd $srcdir/$pkgname-$pkgver
   meson -Dprefix=/usr -Dbuildtype=release -Dlibdir=lib $srcdir/builddir
   cd $srcdir/builddir
   ninja 
}

package() {
    cd $srcdir/builddir
    DESTDIR=$pkgdir ninja install
}
