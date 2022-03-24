# Maintainer: Kevin Brodsky <corax26 at gmail dot com>
# Contributor: Anton Jongsma <anton@felrood.nl>
pkgname=flexc++
pkgver=2.10.01
pkgrel=2
pkgdesc="C++ scanner generator"
arch=('i686' 'x86_64')
url="https://fbb-git.gitlab.io/flexcpp/"
license=('GPL')
# Versions taken from the 'required' file in sources
depends=('libbobcat>=5.04.01')
makedepends=('icmake>=9.03.01' 'yodl>=4.02.02')
optdepends=()
source=("https://gitlab.com/fbb-git/flexcpp/-/archive/${pkgver}/flexcpp-${pkgver}.tar.gz")
md5sums=('50aa4f33036c2b7dede4180b79d7e30c')

build() {
  cd "$srcdir/flexcpp-${pkgver}/flexc++"

  CXXFLAGS="$CXXFLAGS --std=c++20"
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
