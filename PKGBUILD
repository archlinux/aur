# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=gimp-plugin-texturize
pkgver=2.1
pkgrel=3
pkgdesc="Generates large textures from a small sample"
arch=('i686' 'x86_64')
url="http://gimp-texturize.sourceforge.net/"
license=('GPL')
depends=('gimp')
makedepends=('perl-xml-parser')
source=(http://downloads.sourceforge.net/sourceforge/gimp-texturize/texturize-${pkgver}_src.tgz)
md5sums=('7f94b8cefc97eaa296b14fdbdc2c995e')

build() {
  cd "$srcdir"/gimp-texturize
  # fix the build with recent versions of gimp
  find . -type f -name "*.c" -exec sed -i '/.*gimpimage_pdb.h.*/ d' '{}' ';'
  find . -type f -name "*.cpp" -exec sed -i '/.*gimpimage_pdb.h.*/ d' '{}' ';'
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/gimp-texturize
  make DESTDIR="$pkgdir" install
}
