# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=cgicc
pkgver=3.2.17
pkgrel=1
pkgdesc="C++ library that simplifies the creation of CGI applications"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/cgicc/"
license=('LGPL3')
makedepends=('doxygen')
options=()
source=("https://ftp.gnu.org/gnu/cgicc/$pkgname-$pkgver.tar.gz"
        "fix_pc_file.patch")
sha256sums=('912108160d5ccbd00a3d215c54a1d855cd9df7247bcf8cddbb1727a6bbfa7347'
            'c1022b2529cc4264b9c8fef1b231c4e62507af293db759a8498d81adbaba193b')

build() {
  cd "$pkgname-$pkgver"
  patch -p2 -b -z .orig < "${srcdir}/fix_pc_file.patch"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
