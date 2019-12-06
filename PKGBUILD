# Maintainer: Theowhy <aur.theowhy@shizoku.fr>
# Contributor:
pkgname=mfgtools
pkgver=1.3.102
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
source=(git+https://github.com/NXPmicro/mfgtools#tag=uuu_$pkgver)
noextract=()
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/uuu_//g'
}

build() {
  cd "$pkgname"
  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$pkgname/build"

  make DESTDIR="$pkgdir/" install
}
