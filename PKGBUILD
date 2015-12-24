# Maintainer: M0Rf30
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=colord-kde
pkgver=0.3.0
pkgrel=2
pkgdesc="Interfaces and session daemon to colord for KDE"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/playground/graphics/colord-kde'
license=('GPL')
depends=('kdelibs' 'colord')
makedepends=('cmake' 'automoc4')
source=("http://download.kde.org/stable/colord-kde/$pkgver/src/$pkgname-$pkgver.tar.bz2"
        'fix_check_include_files.patch')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 -i "${srcdir}/fix_check_include_files.patch" "${srcdir}/${pkgname}-${pkgver}/CMakeLists.txt"
  cmake . -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

md5sums=('d7e3231fa0da675449aef587dc49ed58'
         '4cbf6866d036b7397867f56c30009787')
