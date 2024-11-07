# Maintainer: Mikael Eriksson <miffe@miffe.org>

pkgname=libtypec
pkgver=0.5.2
pkgrel=2
pkgdesc="Know your USB-C Ports"
arch=('x86_64')
url="https://github.com/libtypec/libtypec"
license=('GPL')
#depends=('systemd-libs')
makedepends=('cmake' 'git')
provides=(libtypec lstypec typecstatus)
source=("libtypec::git+https://github.com/libtypec/libtypec.git#tag=libtypec-$pkgver")
sha256sums=('SKIP')

build() {
  cd "libtypec"
  meson setup build
  ninja -C build
  cmake -B build-libtypec -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_SKIP_RPATH=YES -DCMAKE_BUILD_TYPE=Release
  cmake --build build-libtypec
  #cmake -B build-lstypec -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_SKIP_RPATH=YES
  #cmake --build build-lstypec
  #cmake -B utils -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_SKIP_RPATH=YES
}

package() {
  cd "libtypec"
  DESTDIR="$pkgdir" cmake --install build-libtypec
  #DESTDIR="$pkgdir" cmake --install build-lstypec
  #DESTDIR="$pkgdir" cmake --install utils
  #install -Dm755 build-lstypec/lstypec "$pkgdir/usr/bin/lstypec"
  #install -Dm755 utils/typecstatus "$pkgdir/usr/bin/typecstatus"
}
