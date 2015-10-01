# Maintainer: Kevin Brodsky <corax26 at gmail dot com>
# Contributor: Anton Jongsma <anton@felrood.nl>
pkgname=bisonc++
pkgver=4.11.00
pkgrel=1
pkgdesc='C++ parser generator'
arch=('i686' 'x86_64')
url='https://fbb-git.github.io/bisoncpp/'
license=('GPL')
# Versions taken from the 'required' file in sources
depends=('libbobcat>=4.01.00')
makedepends=('icmake>=7.22.01' 'yodl>=3.05.00')
optdepends=()
source=("https://github.com/fbb-git/bisoncpp/archive/${pkgver}.tar.gz"
        'manual_license.patch')
md5sums=('bf91d34887b0145c8fb2d3914d82cc1d'
         'bab1f76582bd7518df6debe7265fdd7c')

build() {
  cd "$srcdir/bisoncpp-${pkgver}/bisonc++"

  patch -p1 -i "$srcdir/manual_license.patch"

  CXXFLAGS="$CXXFLAGS --std=c++11"
  ./build program
  ./build man
  ./build manual
}

package() {
  cd "$srcdir/bisoncpp-${pkgver}/bisonc++"
  ./build install program "${pkgdir}/usr/bin/bisonc++"
  ./build install skel "${pkgdir}/usr/share/bisonc++"
  ./build install man "${pkgdir}/usr/share/man/man1"
  ./build install manual "${pkgdir}/usr/share/doc/bisonc++-doc"
  ./build install std "${pkgdir}/usr/share/doc/bisonc++"
  ./build install extra "${pkgdir}/usr/share/doc/bisonc++-doc"
}
