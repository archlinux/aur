# Maintainer: Michael Straube <m.s.online gmx.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=galois
pkgver=0.4
pkgrel=3
pkgdesc='A computer game of the "falling blocks" type, but with unique features'
arch=('i686' 'x86_64')
url="http://www.nongnu.org/galois/"
license=('GPL3')
depends=('gtkmm' 'libxml++')
source=("http://download.savannah.gnu.org/releases/galois/source/galois-${pkgver}.tar.gz"
        "fix-install-path.patch")
sha256sums=('a168ae6514da1eda5afd761fa4eeaf510d79988d450a716a0c41ce978d99e447'
            'c4247271776f7b5df2b6bb92911c25a9ba3c30796171de5cd7dc1bd78e5a800d')

prepare() {
  cd "${srcdir}"
  patch -p0 < fix-install-path.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CXXFLAGS+=' -std=c++11'
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
