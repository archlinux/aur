# Contributor: Eric Schulte <eschulte@grammatech.com>
# Maintainer: Eric Schulte <eschulte@grammatech.com>
_srcname=libehp
pkgname=libehp-git
pkgver=Release_1.0.0.r36.g1896c4f
pkgrel=1
pkgdesc="Exception handling parsing support for Elf files (eh_frame, etc.)"
arch=('x86_64')
url="https://git.zephyr-software.com/opensrc/libehp"
license=('Apache License 2.0')
optdepends=('elfio: use the elfio library to parse elf files')
makedepends=('git' 'cmake')
provides=('libehp')
source=('git+https://git.zephyr-software.com/opensrc/libehp.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_srcname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_srcname/"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -Bbuild
    make -C build
}

package() {
  cd "$_srcname/build"
  make DESTDIR="$pkgdir" install
}
