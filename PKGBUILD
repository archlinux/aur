# Maintainer: Alejandro Valdes  <alejandrovaldes at live dot com>
pkgname=yuview
_pkgname=YUView
pkgver=2.3
pkgrel=1
pkgdesc="The Free and Open Source Cross Platform YUV Viewer with an advanced analytics toolset"
arch=('x86_64')
url="https://github.com/IENT/YUView"
license=('GPL3')
depends=('qt5-base' 'desktop-file-utils' 'libde265')
provides=("$pkgname")
conflicts=("$pkgname" "$_pkgname")
source=("${url}/archive/${pkgver}.zip"
        'archlinux.patch')
noextract=()
md5sums=('c457c7fa6b122752a1e6d1aaf25352c4'
         '14f0ec2312e20609b2576fde0885e730')
install="$pkgname.install"

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/archlinux.patch"
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  qmake -o Makefile ../$_pkgname-$pkgver/$_pkgname.pro -spec linux-g++
}

build() {
  cd build
  make
}

check() {
  cd build
  make -k check
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install
}
