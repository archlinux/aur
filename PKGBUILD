# Maintainer: Kevin Brodsky <corax26 at gmail dot com>
# Contributor: Anton Jongsma <anton@felrood.nl>
pkgname=bisonc++
pkgver=6.00.00
pkgrel=1
pkgdesc='C++ parser generator'
arch=('i686' 'x86_64')
url='https://fbb-git.github.io/bisoncpp/'
license=('GPL')
# Versions taken from the 'required' file in sources
depends=('libbobcat>=4.02.00')
makedepends=('icmake>=8.01.00' 'yodl>=3.08.01')
optdepends=()
source=("https://github.com/fbb-git/bisoncpp/archive/${pkgver}.tar.gz"
        'manual_license.patch')
md5sums=('8d658a685e0c84839daf6c014bd001af'
         'bab1f76582bd7518df6debe7265fdd7c')

build() {
  cd "$srcdir/bisoncpp-${pkgver}/bisonc++"

  patch -p1 -i "$srcdir/manual_license.patch"

  CXXFLAGS="$CXXFLAGS --std=c++14"
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
