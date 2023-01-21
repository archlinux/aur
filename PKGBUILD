# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=presage
pkgver=0.9.1
pkgrel=2
pkgdesc='An intelligent predictive text entry system'
arch=(x86_64)
url='https://presage.sourceforge.io/'
license=(GPL2)
depends=(sqlite)
makedepends=()
source=(https://download.sourceforge.net/project/presage/presage/$pkgver/$pkgname-$pkgver.tar.gz
        presage-gcc6.patch
        presage-c++17.patch
        presage-format-security.patch)
sha256sums=('5ed567e350402a1d72c9053c78ecec3be710b7e72153a0223c6d19a7fe58a366'
            '81f1c7ef4d485222269e4467a79451a5515f3d633d84182d78c95683d1575015'
            'b99fad9ff0a9f05dfa70114b630e45697683ebdd61af40160ab0fba65288dc9b'
            'bd177b53709483ba16e44c5ef61f96feca99ce9d08258b21fcb0dbe72839ae34')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../presage-gcc6.patch # Fix build with GCC 6
  patch -p1 -i ../presage-c++17.patch # Fix build with C++17 (Debian)
  patch -p1 -i ../presage-format-security.patch # Fix build with Werror=format-security (Debian)
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" make install
}
