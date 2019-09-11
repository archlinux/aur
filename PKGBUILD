# Maintainer: Kevin Brodsky <corax26 at gmail dot com>
# Contributor: Anton Jongsma <anton@felrood.nl>
pkgname=bisonc++
pkgver=6.03.00
pkgrel=1
pkgdesc='C++ parser generator'
arch=('i686' 'x86_64')
url='https://fbb-git.gitlab.io/bisoncpp/'
license=('GPL')
depends=('libbobcat')
makedepends=('icmake' 'yodl')
optdepends=()
source=("https://gitlab.com/fbb-git/bisoncpp/-/archive/${pkgver}/bisoncpp-${pkgver}.tar.gz"
        'manual_license.patch')
md5sums=('13dcb06e43a55e0f90303e3572ac269c'
         'bab1f76582bd7518df6debe7265fdd7c')

build() {
  cd "$srcdir/bisoncpp-${pkgver}/bisonc++"

  patch -p1 -i "$srcdir/manual_license.patch"

  CXXFLAGS="$CXXFLAGS --std=c++2a"
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
