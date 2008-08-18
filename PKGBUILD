# Maintainer: damir <damir@archlinux.org>
# Contributor: Konstantinos Pachnis <kpachnis@mes-direct.com>

pkgname=cmake
pkgver=2.6.0
pkgrel=2
pkgdesc="CMake is a cross-platform open-source make system"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.cmake.org"
depends=('gcc-libs>=4.0.3' 'libidn' 'openssl' 'ncurses>=5.6-7')
source=("http://www.cmake.org/files/v2.6/$pkgname-$pkgver.tar.gz")

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./bootstrap --prefix=/usr --mandir=/share/man --docdir=/share/cmake-2.6/doc
  make || return 1
  make DESTDIR=$startdir/pkg install

  install -Dm644 $startdir/src/$pkgname-$pkgver/Copyright.txt $startdir/pkg/usr/share/licenses/$pkgname/Copyright.txt

  # Correct permissions
  #find $startdir/pkg/usr/share/CMake/Modules -type f -exec chmod 644 "{}" ";"
}
md5sums=('e95ae003672dfc6c8151a1ee49a0d4a6')
