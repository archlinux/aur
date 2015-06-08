# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=arm-frc-linux-gnueabi-frcmake-hg
pkgver=r66.eec4367471da
pkgrel=2
pkgdesc="Wrapper scripts for using CMake with the FRC toolchain"
arch=('any')
url="https://bitbucket.org/byteit101/toolchain-builder/"
license=('GPL')
makedepends=('mercurial')
provides=('arm-frc-linux-gnueabi-frcmake')
groups=('frc-2015')
depends=('cmake')
_hgrepo='toolchain-builder'
source=(hg+https://bitbucket.org/byteit101/toolchain-builder/"$_hgrepo")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_hgrepo"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "$srcdir/$_hgrepo/tools"
  make -f frcmake-nix-makefile DESTDIR="$pkgdir" install || return 1
}
