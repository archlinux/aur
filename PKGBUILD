# Maintainer: Kevin Brodsky <corax26 at gmail dot com>
# Contributor: Anton Jongsma <anton@felrood.nl>
pkgname=flexc++
pkgver=2.06.04
pkgrel=1
pkgdesc="C++ scanner generator"
arch=('i686' 'x86_64')
url="https://fbb-git.github.io/flexcpp/"
license=('GPL')
# Versions taken from the 'required' file in sources
depends=('libbobcat>=4.01.00')
makedepends=('icmake>=8.00.04' 'yodl>=3.06.00')
optdepends=()
source=("https://github.com/fbb-git/flexcpp/archive/${pkgver}.tar.gz")
md5sums=('d568d1083e90c20a9ffa76a935c93c33')

build() {
  cd "$srcdir/flexcpp-${pkgver}/flexc++"

  CXXFLAGS="$CXXFLAGS --std=c++14"
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
