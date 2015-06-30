# Maintainer: Yuval Adam <yuv dot adm at gmail dot com> PGP-Key: CC2115C12D99D2F0

pkgname=lm4tools-git
pkgver=a565880
pkgrel=1
pkgdesc="A set of tools which enable multi-platform development on the TI Stellaris Launchpad boards"
arch=('any')
url="https://github.com/utzig/lm4tools"
license=('GPL')
depends=('libusb')
makedepends=('git' 'gcc' 'make')
provides=('lm4tools')
source=('git+https://github.com/utzig/lm4tools.git')
md5sums=('SKIP')
_gitname=lm4tools
_binaries=('lm4flash')

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd $_gitname
  for DIR in $_binaries
  do
    cd $DIR
    make
  done
}

package() {
  cd $_gitname
  for B in $_binaries
  do
    install -Dm755 $srcdir/$_gitname/$B/$B $pkgdir/usr/bin/$B
  done
}
