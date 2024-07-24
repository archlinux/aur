# Maintainer: Kevin Brodsky <corax26 at gmail dot com>
# Contributor: Anton Jongsma <anton@felrood.nl>
pkgname=bisonc++
pkgver=6.09.00
pkgrel=1
pkgdesc='C++ parser generator'
arch=('i686' 'x86_64')
url='https://fbb-git.gitlab.io/bisoncpp/'
license=('GPL')
depends=('libbobcat')
makedepends=('icmake' 'yodl')
optdepends=()
source=("https://gitlab.com/fbb-git/bisoncpp/-/archive/${pkgver}/bisoncpp-${pkgver}.tar.gz")
md5sums=('3d9b52817a6762d1859f9e5477618c17')

build() {
  cd "$srcdir/bisoncpp-${pkgver}/bisonc++"

  CXXFLAGS="$CXXFLAGS --std=c++20"
  # Add the -P option not to use precompiled headers, which can be useful since
  # they require a lot of free space, compared to a normal compilation:
  # ./build -P program
  ./build program
  ./build man
  ./build manual
}

package() {
  cd "$srcdir/bisoncpp-${pkgver}/bisonc++"

  # Since 4.12.00, first argument to install is <what to install> (x = all),
  # and second is the base directory
  ./build install x "$pkgdir"
}
