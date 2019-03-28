# Maintainer:
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Guillem Rieu <guillemr@gmx.net>

pkgname=ccgo
pkgver=0.3.6.5
pkgrel=6
pkgdesc='Play the game of Go with gnugo or against other players on IGS'
arch=(x86_64)
url='https://ccdw.org/~cjj/prog/ccgo/'
license=(GPL)
depends=(gtkmm gconfmm)
source=("https://ccdw.org/~cjj/prog/$pkgname/src/$pkgname-$pkgver.tar.gz")
sha256sums=('d12be7fb9170d650ae78197983fac05af21ddbf47f7b1a2a14de9aa832ed602c')

prepare() {
  cd $pkgname-$pkgver

  find -name '*.hh' -type f -exec sed -i '/sigc++\/object.h/d' {} +
  find -name '*.cc' -type f -exec sed -i 's/(bind(/(sigc::bind(/' {} +
}

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  CXXFLAGS="$CXXFLAGS -std=c++11 -fpermissive" make
}

package() {
  DESTDIR="$pkgdir" make -C $pkgname-$pkgver install
}

# getver: ccdw.org/~cjj/prog/ccgo/ChangeLog
# vim: ts=2 sw=2 et:
