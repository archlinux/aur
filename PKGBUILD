# Maintainer: Kevin Brodsky <corax26 at gmail dot com>
# Contributor: Anton Jongsma <anton@felrood.nl>
pkgname=flexc++
pkgver=2.03.03
pkgrel=1
pkgdesc="C++ scanner generator"
arch=('i686' 'x86_64')
url="https://fbb-git.github.io/flexcpp/"
license=('GPL')
# Versions taken from the 'required' file in sources
depends=('libbobcat>=4.01.00')
makedepends=('icmake>=7.22.00' 'yodl>=3.05.00')
optdepends=()
source=("https://github.com/fbb-git/flexcpp/archive/${pkgver}.tar.gz")
md5sums=('6aca2723aacb909bd99324a3a4951a6e')

build() {
  cd "$srcdir/flexcpp-${pkgver}/flexc++"

  CXXFLAGS="$CXXFLAGS --std=c++11"
  # Add the -P option not to use precompiled headers, which can be useful since
  # they require a lot of free space, compared to a normal compilation:
  # ./build -P program
  ./build program
  ./build man
  ./build manual
}

package() {
  cd "$srcdir/flexcpp-${pkgver}/flexc++"

  # Since 2.03.02, first argument to install is <what to install> (x = all),
  # and second is the base directory
  ./build install x "$pkgdir"
}
