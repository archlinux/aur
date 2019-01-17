# Maintainer: Theowhy <aur.theowhy@shizoku.fr>
# Contributor:
pkgname=mfgtools
pkgver=1.2.61
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
sha256sums=('79e61f94a806f6fde8adaf3d0deb09e7969273dc85dd531ad6191e0adba66b13')

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
