# Maintainer: muttleyxd <muttdini[ at ]gmail.com>
pkgname=arma3-linux-launcher-git
pkgver=108.8fae161
pkgrel=1
pkgdesc="Advanced launcher for ArmA 3 on Linux"
arch=('i686' 'x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'qt5-base' 'qt5-svg')
makedepends=('cmake' 'make')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("$pkgname::git://github.com/muttleyxd/arma3-unix-launcher.git")
md5sums=('SKIP')

pkgver() 
{
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() 
{
  cd "$srcdir/$pkgname"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() 
{
  cd "$srcdir/$pkgname"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir" install
}
