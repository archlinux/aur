# Maintainer:
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
pkgname=tora
pkgver=2.1.3
pkgrel=4
pkgdesc="Toolkit for databases with support for MySQL and PostgreSQL"
arch=('i686' 'x86_64')
url="http://tora.sourceforge.net"
license=('GPL')
depends=('qscintilla')
makedepends=('cmake')
options=('!libtool' '!emptydirs')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
	'include_unistd.patch')
md5sums=('ea4a75a9daeaf58492413e3f7fe40293'
         'b621c5aa5ef7106571001a95bc11b07d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/include_unistd.patch"
  mkdir "${srcdir}/build"
  cd "${srcdir}/build"
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}
