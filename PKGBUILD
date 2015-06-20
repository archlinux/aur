pkgname=abgx360
pkgver=1.0.6
pkgrel=2
pkgdesc="An app for checking Xbox 360 ISOs"
url="http://abgx360.xecuter.com/"
arch=('x86_64' 'i686')
license=('unknown')
depends=('zlib' 'curl')
optdepends=('abgx360gui: a GUI for this tool')
source=("http://abgx360.xecuter.com/dl/${pkgname}-${pkgver}.tar.gz")
md5sums=('04b0c9e0461faa92ca5f8fac78bafe57')
install=abgx360.install

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # abgx360.net is somehow no longer working, so we'll switch to abgx360.xecuter.com for now
  sed -i 's/abgx360.net/abgx360.xecuter.com/g' src/abgx360.c
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  #./autogen.sh
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
