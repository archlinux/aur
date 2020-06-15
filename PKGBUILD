# Maintainer: Jianqiu Zhang <void001@archlinuxcn.org>

pkgname=ipmctl-git
pkgver=v02.00.00.3673.r14.gc9a426c7
pkgrel=1
pkgdesc="util for configuring and managing Intel Optane DC persistent memory modules (DCPMM)."
arch=('x86_64')
url="https://github.com/intel/ipmctl"
license=(GPL3)
depends=()
makedepends=(cmake)
source=(${pkgname}::git+https://github.com/intel/ipmctl)
md5sums=('SKIP')

pkgver()
{
  cd $srcdir/$pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
  echo "prepare()"
}

build() {
  cd "$srcdir/$pkgname"
  mkdir build && cd build
  cmake -DRELEASE=ON -DCMAKE_INSTALL_PREFIX=$pkgdir/usr ..
  make -j all
}

package() {
  cd $srcdir/$pkgname/build
  make install
}

# vim:set ts=2 sw=2 et:

