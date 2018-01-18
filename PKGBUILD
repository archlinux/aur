# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=arm-frc-linux-gnueabi-frcmake-git
pkgver=r102.c13ded0
pkgrel=1
pkgdesc="Wrapper scripts for using CMake with the FRC toolchain"
arch=('any')
url="https://github.com/wpilibsuite/toolchain-builder/"
license=('GPL')
makedepends=('git')
conflicts=('arm-frc-linux-gnueabi-frcmake-hg')
provides=('arm-frc-linux-gnueabi-frcmake')
groups=('frc-toolchain')
depends=('cmake')
source=(git+https://github.com/wpilibsuite/toolchain-builder)
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/toolchain-builder"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/toolchain-builder/tools"
  make -f frcmake-nix-makefile DESTDIR="$pkgdir" install || return 1
}
