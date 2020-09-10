# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Tobias Mueller <gtklp@sirtobi.com>

pkgname=gtklp
pkgver=1.3.4
pkgrel=2
pkgdesc="A graphical frontend for cups, the linux printing system"
arch=('i686' 'x86_64')
url="http://gtklp.sirtobi.com"
license=('GPL')
depends=('cups' 'gtk2')
makedepends=('gcc9')
source=("${pkgname}-${pkgver}.src.tar.gz::https://sourceforge.net/projects/gtklp/files/gtklp/${pkgver}/gtklp-${pkgver}.src.tar.gz/download")
sha256sums=('be07609042595fa932034e3b2d7038cef33901ec0863fcedbb5188acb6b53bab')

build() {
  cd "${pkgname}-${pkgver}"
  aclocal -I m4
  autoheader --force
  autoconf --force
  automake --add-missing --copy --include-deps --foreign --force-missing
  ./configure CC=gcc-9 --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}