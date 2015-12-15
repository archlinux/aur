#Maintainer:	Jesse Jaara	<gmail.com: jesse.jaara>
#Contributor:	Jussi Timperi	<gmail.com: jussi.timperi>

pkgname=libvoikko
pkgver=4.0
pkgrel=2
pkgdesc="A library of free Finnish language tools using Malaga"
arch=('i686' 'x86_64')
url="http://voikko.sourceforge.net"
license=('GPL2')
makedepends=('python')
optdepends=('voikko-fi: The actual dictionary'
            'voikko-fi-malaga: Old malaga based dictionary'
            'python: For python bindings')
options=(!libtool)
source=(http://www.puimula.org/voikko-sources/libvoikko/${pkgname}-${pkgver}.tar.gz)
md5sums=('c22c63d85554776e354372567e0e67fe')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --enable-hfst=false --with-dictionary-path=/usr/share/voikko
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

#  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
  mkdir -p "${pkgdir}/usr/lib/python3.5/site-packages"
  cp python/libvoikko.py "${pkgdir}/usr/lib/python3.5/site-packages/libvoikko.py"
}

