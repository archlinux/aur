# Maintainer: Kyle Brooks <brookskd[at]gmail[dot]com>
pkgname=systemc
pkgver=2.3.1
pkgrel=1
pkgdesc="SystemC is a set of C++ classes and macros which provide an event-driven simulation interface. SystemC is for modeling and describing complex hardware systems."
url="http://www.accellera.org/downloads/standards/systemc"
arch=('x86_64' 'i686')
license=('custom:SystemC Open Source License')
depends=()
optdepends=()
makedepends=()
conflicts=('systemc')
provides=('systemc')
source=("http://www.accellera.org/downloads/standards/systemc/accept_license/accepted_download/${pkgname}-${pkgver}.tgz")
md5sums=('a6437844f7961c4e47d9593312f6311c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir objdir
  cd objdir
  ../configure --prefix=/usr --with-unix-layout=yes
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/objdir"
  make DESTDIR="${pkgdir}" install
  cd ..
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 docs/SystemC_Open_Source_License.pdf "$pkgdir/usr/share/licenses/$pkgname/SystemC_Open_Source_License.pdf"
}

# vim:set ts=2 sw=2 et:
