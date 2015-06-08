# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Andreas Radke <andyrtr at archlinux.org>
# Contributor: eric <eric@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=raptor1
pkgrel=5
pkgver=1.4.21
pkgdesc='C library that parses RDF/XML/N-Triples into RDF triples - old V1 api for compatibility'
arch=('i686' 'x86_64')
url="http://librdf.org/raptor"
depends=('curl' 'libxslt')
license=('LGPL')
options=('!libtool' '!docs')
source=("http://librdf.org/dist/source/raptor-$pkgver.tar.gz"
        'curl.patch')
md5sums=('992061488af7a9e2d933df6b694bb876'
         '8fe28761645d6a6607b25c94f9ada964')

prepare() {
  cd "${srcdir}"/raptor-${pkgver}

  patch -p1 -i "${srcdir}"/curl.patch
}

build() {
  cd "${srcdir}"/raptor-${pkgver}

  ./configure --prefix=/usr \
    --disable-static
  make
}

package() {
  cd "${srcdir}/raptor-${pkgver}"
  make prefix="${pkgdir}"/usr install
  
  install -Dm755 "${pkgdir}"/usr/bin/rapper "${pkgdir}"/usr/bin/rapperV1
  rm -f "${pkgdir}"/usr/bin/rapper
  install -Dm644 "${pkgdir}"/usr/share/man/man1/rapper.1 "${pkgdir}"/usr/share/man/man1/rapperV1.1
  rm -f "${pkgdir}"/usr/share/man/man1/rapper.1
}

