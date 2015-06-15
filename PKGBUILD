# Maintainer: Narthana Epa <narthana.epa+aur@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

_upname=kile
pkgname=kile-autocompletenoblankline
pkgver=2.1.3
pkgrel=1
pkgdesc="Patched to not insert a black line after autocompleting an environment"
arch=("i686" "x86_64")
license=('GPL2')
url="http://kile.sourceforge.net/"
depends=('kdebase-runtime' 'texlive-core' 'kdebase-katepart')
makedepends=('cmake' 'automoc4')
conflicts=('kile')
provides=("kile-${pkgver}")
optdepends=('kdebase-konsole: embedded terminal')
install=${_upname}.install
source=("http://downloads.sourceforge.net/$_upname/$_upname-$pkgver.tar.bz2"
	"autocomplete_noblankline.patch")
sha1sums=('1a80748d5f01f359b5e5c28140ec90691f0166c5'
          'ffd0414d23b30eb68a0e60ad951e05002992322f')

build() {
  cd "${srcdir}/${_upname}-${pkgver}"
  patch -p1 < ../autocomplete_noblankline.patch
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../${_upname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}
