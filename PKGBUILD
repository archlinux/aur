# Maintainer: Theowhy <aur.theowhy@shizoku.fr>
pkgname=mfgtools
pkgver=1.2.39
pkgrel=1
pkgdesc="Freescale/NXP I.MX Chip image deploy tools"
arch=(x86_64)
url="https://github.com/NXPmicro/mfgtools"
license=('BSD')
groups=()
depends=('bzip2' 'zlib' 'libusb')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/NXPmicro/mfgtools/archive/uuu_$pkgver.tar.gz)
noextract=()
sha256sums=('3bcc473536cb883656172c6c07357477752b3cef816de4295434338ce10699ac')

build() {
  cd "$pkgname-uuu_$pkgver"
  echo "#define GIT_VERSION \"uuu_$pkgver\"" > libuuu/gitversion.h
  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$pkgname-uuu_$pkgver/build"

  make DESTDIR="$pkgdir/" install
}
