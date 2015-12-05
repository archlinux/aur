# Contributor: rich_o <aurua@riseup.net>
# Maintainer: rich_o <aurua@riseup.net>

pkgname="ncmpcpp-git"
pkgver=1975.79d2863
pkgrel=1
epoch=1
pkgdesc="An almost exact clone of ncmpc with some new features." 
arch=('i686' 'x86_64')
url="http://unkart.ovh.org/ncmpcpp/"
license=('GPL2')
depends=('ncurses' 'libmpdclient>=2.8' 'boost-libs' 'readline')
makedepends=('git' 'boost' 'pkg-config')
optdepends=('curl: fetch lyrics'
            'taglib: tag editor'
            'fftw: frequency spectrum mode visualization')
conflicts=('ncmpcpp' 'ncmpcpp-xdg-config' 'ncmpcpp-xdg-config-git' 'ncmpcpp-color')
install=${pkgname}.install
source=("git+https://github.com/arybczak/ncmpcpp")
md5sums=('SKIP')

pkgver() {
  cd ncmpcpp || exit
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd ncmpcpp || exit
  ./autogen.sh BOOST_LIB_SUFFIX='' \
  --prefix=/usr \
  --enable-clock \
  --enable-outputs \
  --enable-visualizer
  make
} 

package() {
  cd ncmpcpp || exit
  # make PREFIX=/usr DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}/" install
  # find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
}
