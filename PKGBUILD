# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Todd Harbour <aur @AT@ quadronyx .DOT. org>

pkgname=wmclockmon
pkgver=0.8.1
pkgrel=6
pkgdesc="A dockapp which displays a clock in 12/24h mode with alarm mode and 3 different LCD styles"
arch=('i686' 'x86_64')
license=('GPL')
url="http://tnemeth.free.fr/projets/dockapps.html"
depends=('gtk2' 'libxpm')
source=("http://tnemeth.free.fr/projets/programmes/$pkgname-$pkgver.tar.gz"
	"build1.2.patch"
	"build2.0.patch")
md5sums=('e5569e326f5542a181dd123836f652ee'
         '793aa2abf60996d29de4ef97cc7b37fa'
         '641dc6f5bc5449a59fe206cefa068b95')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # builds against gtk+1.2
  #patch -Np2 -b -z .orig -i "$srcdir/build1.2.patch"

  # builds against gtk+2.0
  patch -Np2 -b -z .orig -i "$srcdir/build2.0.patch"

  autoreconf -fiv
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
