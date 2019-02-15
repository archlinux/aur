# Maintainer: Theowhy <aur.theowhy@shizoku.fr>
# Contributor:
pkgname=mfgtools
pkgver=1.2.68
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
changelog=History.md
source=(https://github.com/NXPmicro/mfgtools/archive/uuu_$pkgver.tar.gz)
noextract=()
sha256sums=('7a19847939a79f82a8eab526258bdc6ae8e01ffe1684be34bbdf1dfbdfdde9bd')

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
